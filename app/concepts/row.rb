class Row < NumberGroup
  def initialize(grid, row_number)
    @grid, @row_number = grid, row_number
    super(items)
  end

  def items
    @grid[row_index]
  end

  def row_index
    @row_number - 1
  end
end
