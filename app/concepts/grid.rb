class Grid
  SUBGRID_DIMENSIONS = [(0..2),(3..5),(6..8)].product [(0..2),(3..5),(6..8)]
  WIDTH = 9
  HEIGHT = 9

  delegate :size, to: :values

  attr_reader :values

  def initialize(cells)
    @values = cells.each_slice(WIDTH).to_a
  end

  def rows
    @values
  end

  def columns
    @values.transpose
  end

  def subgrids
    SUBGRID_DIMENSIONS.map do |row_range, column_range|
      @values.slice(row_range).transpose.slice(column_range).flatten
    end
  end
end
