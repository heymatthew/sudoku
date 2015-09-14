class Answer
  attr_accessor :errors

  WIDTH  = 9
  HEIGHT = 9

  SUBGRID_DIMENSIONS = [(0..2),(3..5),(6..8)].product [(0..2),(3..5),(6..8)]

  def initialize(cells)
    @cells = cells
    @errors = []
  end

  def grid
    @grid ||= @cells.each_slice(WIDTH).to_a
  end

  def columns
    grid.transpose.map { |column| SudokuGroup.new(column) }
  end

  def rows
    grid.map { |row| SudokuGroup.new(row) }
  end

  def subgrids
    SUBGRID_DIMENSIONS.map do |grid_row_range, grid_column_range|
      subgrid = grid.slice(grid_row_range).transpose.slice(grid_column_range)
      SudokuGroup.new(subgrid)
    end
  end

  def valid?
    errors = []

    if not_enough_cells?
      errors.push "need #{expected_cell_count} to play sudoku"
    else
      errors.push(*row_errors)
      errors.push(*column_errors)
      errors.push(*subgrid_errors)
    end

    errors.none?
  end

  def not_enough_cells?
    @cells.count != expected_cell_count
  end

  def expected_cell_count
    WIDTH * HEIGHT
  end

  def row_errors
    rows.reject(&:valid).map(:errors)
  end

  def column_errors
    columns.reject(&:valid).map(:errors)
  end

  def subgrid_errors
    subgrids.reject(&:valid).map(:errors)
  end
end
