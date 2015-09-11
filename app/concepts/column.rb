class Column < NumberGroup
  def initialize(grid, column_number)
    @grid, @column_number = grid, column_number
    super(items)
  end

  def items
    9.times.map do |row_index|
      item_at(row_index, column_index)
    end
  end

  def column_index
    @column_number - 1
  end

  def item_at(row_index, column_index)
    index = (row_index * Grid::WIDTH) + column_index
    @grid[index]
  end
end
