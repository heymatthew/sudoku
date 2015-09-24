class Grid
  SUBGRID_DIMENSIONS = [(0..2),(3..5),(6..8)].product([(0..2),(3..5),(6..8)])
  WIDTH = 9
  HEIGHT = 9
  SIZE = WIDTH * HEIGHT

  delegate :size, to: :values

  def initialize(values)
    if values.count != SIZE
      raise ArgumentError, "initial values don't match expected size"
    end

    @values = values.clone
  end

  def compose_with_guess(guess)
    if guess.count != SIZE
      raise ArgumentError, "composed guess doesn't match expected size"
    end

    cells.zip(guess).each do |cell, guess_value|
      cell.value = guess_value
    end

    self
  end

  def values
    @values.clone
  end

  def cells
    @cells ||= construct_cells_from_values
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
    @cells.all?(&:set?)
  end

  private

  def construct_cells_from_values
    @values.map { |value| Cell.new(value) }
  end
end
