class Grid
  SUBGRID_DIMENSIONS = [(0..2),(3..5),(6..8)].product [(0..2),(3..5),(6..8)]
  WIDTH = 9
  HEIGHT = 9

  delegate :size, to: :values

  attr_reader :values

  def initialize(cells)
    fail "impossibru grid construction detected" if cells.size != grid_size

    @values = break_into_rows(cells)
  end

  def grid_size
    WIDTH * HEIGHT
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

  def complete?
    @values.flatten.select(&:empty?).count == 0
  end

  protected

  def break_into_rows(cells)
    cells.each_slice(WIDTH).to_a
  end
end
