class Grid
  SUBGRID_DIMENSIONS = [(0..2),(3..5),(6..8)].product([(0..2),(3..5),(6..8)])
  WIDTH = 9
  HEIGHT = 9

  delegate :size, to: :values

  def initialize(values, initial_grid: false)
    fail "impossibru grid construction detected" if values.count != grid_size
    @values = values
  end

  def cells
    @cells ||= build_cells_from_values
  end

  def lock_set_cells
    set_cells.each(&:lock_cell)
  end

  def grid_size
    WIDTH * HEIGHT
  end

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
    @cells.flatten.none?(&:empty?)
  end

  private

  def build_cells_from_values
    @values.map { |value| Cell.new(value) }
           .collect(&:lock_if_set)
  end
end
