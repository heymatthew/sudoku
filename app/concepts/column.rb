class Column < NumberGroup
  def initialize(answer, column_number)
    @answer, @column_number = answer, column_number
    super(items)
  end

  def items
    Answer::HEIGHT.times.map do |row_index|
      @answer[row_index][column_index]
    end
  end

  def column_index
    @column_number - 1
  end
end
