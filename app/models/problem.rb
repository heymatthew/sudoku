class Problem < ActiveRecord::Base
  validates :cells, presence: true, format: {
    with: /\A(?:\d?,){80}\d?\z/,
    message: "requires 81 single didgits separated by commas"
  }

  def grid=(grid)
    self.cells = grid.cells.join(",")
  end

  def grid
    Grid.new(split_cells)
  end

  private

  def split_cells
    keep_trailing_empties = -1
    cells.split(',', keep_trailing_empties)
  end
end
