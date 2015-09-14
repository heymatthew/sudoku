SudokuGroup = Struct.new(:items) do
  VALID_RANGE = (1..9)

  attr_accessor :errors

  def valid?
    errors = []
    check_for_duplicate_values
    check_for_invalid_values
    errors.none?
  end

  def filled_out_cells
    @filled_out_cells ||= items.reject(&:empty?)
  end

  def check_for_duplicate_values
    if duplicate_values.any?
      "duplicate values: #{duplicate_values.to_sentence}"
    end
  end

  def check_for_invalid_values
    if invalid_items.any?
      "invalid values: #{invalid_items.to_sentence}"
    end
  end

  def duplicate_values
    filled_out_cells.group_by { |item| item }
      .select { |item, matching| matching.count > 1 }
      .keys
  end

  def invalid_items
    filled_out_cells.select { |item| VALID_RANGE.include?(item.to_i) }
  end
end
