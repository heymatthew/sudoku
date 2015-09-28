class Grid
  include ActiveModel::Model

  SUBGRID_DIMENSIONS = [(0..2),(3..5),(6..8)].product([(0..2),(3..5),(6..8)])
  WIDTH = 9
  HEIGHT = 9
  SIZE = WIDTH * HEIGHT

  attr_accessor :cells

  validates :cells, length: { is: SIZE }

  def rows
    @rows ||= cells.each_slice(WIDTH).to_a
  end

  def columns
    @columns ||= rows.transpose
  end

  def subgrids
    @subgrids ||= SUBGRID_DIMENSIONS.map do |row_range, column_range|
      rows.slice(row_range).transpose.slice(column_range).flatten
    end
  end

  def complete?
    values.none?(&:nil?)
  end

  private

  def values
    @cells.map(&:value)
  end
end
