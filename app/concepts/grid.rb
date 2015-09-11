class Grid
  attr_accessor :errors

  WIDTH = 9
  HEIGHT = 9

  def initialize(cells)
    @cells = cells
    @errors = []
  end

  def valid?
    if not_enough_cells?
      errors.push "need #{expected_grid_size} to play sudoku"
    end

    errors.none?
  end

  def not_enough_cells?
    @cells.count != expected_grid_size
  end

  def expected_grid_size
    WIDTH * HEIGHT
  end
end
