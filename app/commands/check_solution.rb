class CheckSolution
  def initialize(grid)
    @submitted_grid = grid
    @errors = []
  end

  def call
    check(:rows)
    check(:columns)
    check(:subgrids)
    check_cells

    solution_grid
  end

  private

  def solution_grid
    @solution_grid ||= Grid.new(cells: solution_cells)
  end

  def solution_cells
    @submitted_grid.cells.map { |cell| SolutionCell.new(cell) }
  end

  def check(method)
    zipped_groups_with_duplicates(method).each do |submitted_cells, solution_cells|
      mark_cells_as_duplicate(method.to_s, solution_cells)
    end
  end

  def zipped_groups_with_duplicates(method)
    zipped_groups(method).select do |submitted_cells, solution_cells|
      submitted_cells
        .select(&:value) # don't check null cells
        .group_by(&:value)
        .any? { |grouped_value, matching| matching.count > 1 }
    end
  end

  def zipped_groups(method)
    @submitted_grid.send(method).zip(solution_grid.send(method))
  end

  def mark_cells_as_duplicate(group_name, cells)
    cells.each do |cell|
      cell.errors.push "duplicate values in #{group_name}"
    end
  end

  def check_cells
    invalid_cell_pairs.each do |submitted_cell, solution_cell|
      error_message = "invalid value #{submitted_cell.value}"
      solution_cell.errors.push(error_message)
    end
  end

  def invalid_cell_pairs
    zipped_groups(:cells).reject do |submitted_cell, solution_cell|
      submitted_cell.valid?
    end
  end

  def valid_cells
    @grid.cells
  end
end
