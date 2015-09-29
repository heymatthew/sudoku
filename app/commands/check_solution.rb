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
    find_duplicate_cells_in(method).each do |cell|
      cell.errors << "duplicate values in #{method.to_s}"
    end
  end

  def find_duplicate_cells_in(method)
    duplicate_groups = solution_grid.send(method).select do |cells|
      cells
        .map(&:underlying_cell)
        .reject(&:partial_answer?) # allow partial answers
        .group_by(&:value)
        .any? { |grouping, matches| matches.count > 1 }
    end

    duplicate_groups.flatten
  end

  def check_cells
    invalid_cells.each do |cell|
      cell.errors << "invalid value #{cell.value}"
    end
  end

  def invalid_cells
    solution_grid.cells.reject { |cell| cell.underlying_cell.valid? }
  end
end
