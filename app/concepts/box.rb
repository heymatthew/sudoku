class Box < NumberGroup
  BOXED_WIDTH = Answer::HEIGHT / 3
  BOXED_HEIGHT = Answer::WIDTH / 3

  def initialize(answer, row_number, column_number)
    @answer, @column_number, @row_number = answer, column_number, row_number
    super(items)
  end

  def items
    box_grid.flatten
  end

  def box_grid
    @answer.slice(row_range).map do |box_row|
      select_columns_from_row(box_row)
    end
  end

  def select_columns_from_row(row)
    column_slices = row.each_slice(BOXED_WIDTH)
    column_slices.to_a[column_index]
  end

  def row_range
    (boxed_start..boxed_end)
  end

  def boxed_start
    row_index * BOXED_HEIGHT
  end

  def boxed_end
    boxed_start + BOXED_HEIGHT - 1
  end

  def row_index
    @row_number - 1
  end

  def column_index
    @column_number - 1
  end
end
