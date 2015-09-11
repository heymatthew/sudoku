class Column < NumberGroup
  def initialize(grid, column_number)
    @grid, @column_number = grid, column_number
    super(items)
  end

  def items
    Grid::HEIGHT.times.map do |row_index|
      @grid[row_index][column_index]
    end
  end

  def column_index
    @column_number - 1
  end
end
