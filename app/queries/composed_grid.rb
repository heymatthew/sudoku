class ComposedGrid
  def initialize(problem_grid, submitted_grid)
    @problem_grid, @submitted_grid = problem_grid, submitted_grid
  end

  def grid
    Grid.new(cells: composed_cells)
  end

  private

  def composed_cells
    cells.map do |problem_cell, submitted_cell|
      Cell.new(
        locked: problem_cell.locked,
        value:  problem_cell.value || submitted_cell.value
      )
    end
  end

  def cells
    problem_grid.cells.zip(submission_grid.cells)
  end
end
