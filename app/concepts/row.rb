class Row < NumberGroup
  def initialize(grid, row_number)
    @grid, @row_number = grid, row_number
    super(items)
  end

  def items
    @grid.slice(row_range)
  end

  def row_range
    (start_of_row...end_of_row)
  end

  def start_of_row
    Grid::WIDTH * (@row_number - 1)
  end

  def end_of_row
    start_of_row + Grid::WIDTH
  end
end
