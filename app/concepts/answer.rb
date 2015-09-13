class Answer
  attr_accessor :errors

  delegate :slice, to: :grid

  WIDTH = 9
  HEIGHT = 9

  GRID_SQUARES = (1..3).to_a.product (1..3).to_a

  def initialize(cells)
    @cells = cells
    @errors = []
  end

  def [](index)
    grid[index]
  end

  def valid?
    if not_enough_cells?
      errors.push "need #{expected_grid_size} to play sudoku"
    else
      check_grid_rows
      check_grid_columns
      check_grid_squares
    end

    errors.none?
  end

  def check_grid_rows
    (1..HEIGHT).each do |row_number|
      row = Row.new(self, row_number)

      if !row.valid?
        errors.push(*row.errors)
      end
    end
  end

  def check_grid_columns
    (1..WIDTH).each do |column_number|
      column = Column.new(self, column_number)

      if !column.valid?
        errors.push(*column.errors)
      end
    end
  end

  def check_grid_squares
    GRID_SQUARES.each do |row_number, column_number|
      box = Box.new(self, row_number, column_number)

      if !box.valid?
        errors.push(*box.errors)
      end
    end
  end

  def not_enough_cells?
    @cells.count != expected_grid_size
  end

  def expected_grid_size
    WIDTH * HEIGHT
  end

  def grid
    @grid ||= @cells.each_slice(WIDTH).to_a
  end
end
