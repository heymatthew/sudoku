class Problem < ActiveRecord::Base
  validates :values, presence: true, format: {
    with: /\A(?:\d?,){80}\d?\z/,
    message: "requires 81 single didgits separated by commas"
  }

  def grid=(grid)
    self.values = grid.values.join(",")
  end

  def grid
    Grid.new(split_values, initial_grid: true)
  end

  private

  def split_values
    keep_trailing_empties = -1
    values.split(',', keep_trailing_empties)
  end
end
