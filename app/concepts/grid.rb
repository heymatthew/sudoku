class Grid
  SUBGRID_DIMENSIONS = [(0..2),(3..5),(6..8)].product([(0..2),(3..5),(6..8)])
  WIDTH = 9
  HEIGHT = 9

  delegate :size, to: :values

  def initialize(values)
    fail "impossibru grid construction detected" if values.count != grid_size

    cells = values.map { |value| Cell.new(value) }
    @cells = break_into_rows(cells)
  end

  def grid_size
    WIDTH * HEIGHT
  end

  def values
    @cells.flatten
  end

  def rows
    @cells
  end

  def columns
    @cells.transpose
  end

  def subgrids
    SUBGRID_DIMENSIONS.map do |row_range, column_range|
      @cells.slice(row_range).transpose.slice(column_range).flatten
    end
  end

  def complete?
    @cells.flatten.none?(&:empty?)
  end

  protected

  def break_into_rows(cells)
    cells.each_slice(WIDTH).to_a
  end
end
