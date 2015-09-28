class ComposeGrids
  def initialize(problem_grid, submitted_grid)
    @problem_grid, @submitted_grid = problem_grid, submitted_grid
  end

  def grid
    Grid.new(cells: composed_cells)
  end

  private

  def composed_cells
    zipped_cells.each.map do |problem_cell, submitted_cell|
      Cell.new(
        locked: problem_cell.locked,
        value:  problem_cell.value || submitted_cell.value
      )
    end
  end

  def zipped_cells
    @problem_grid.cells.zip(@submitted_grid.cells)
  end
end
