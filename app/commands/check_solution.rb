class CheckSolution
  def initialize(grid)
    @submitted_grid = grid
    @errors = []
  end

  def call
    mark_errors_in(solution_grid.rows,     'row')
    mark_errors_in(solution_grid.columns,  'column')
    mark_errors_in(solution_grid.subgrids, 'subgrid')
    apply_errors_to_invalid_cells

    solution_grid
  end

  private

  def solution_grid
    @solution_grid ||= Grid.new(cells: solution_cells)
  end

  def solution_cells
    @submitted_grid.cells.map { |cell| SolutionCell.new(cell) }
  end

  def mark_errors_in(cell_groups, hint)
    filter_duplicate_cells_in(cell_groups).flatten.each do |cell|
      cell.errors << "duplicate values in #{hint}"
    end
  end

  def filter_duplicate_cells_in(cell_groups)
    cell_groups.select do |cells|
      cells
        .map(&:underlying_cell)
        .reject(&:partial_answer?)
        .group_by(&:value)
        .any? { |grouping, matches| matches.count > 1 }
    end
  end

  def apply_errors_to_invalid_cells
    invalid_cells.each do |cell|
      cell.errors << "invalid value #{cell.value}"
    end
  end

  def invalid_cells
    solution_grid.cells.reject { |cell| cell.underlying_cell.valid? }
  end
end
