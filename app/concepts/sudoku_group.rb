class SudokuGroup
  attr_reader :errors
  attr_reader :items

  def initialize(items)
    @items = items
    @errors = []
  end

  def valid?
    check_for_duplicate_values
    check_for_invalid_values
    errors.none?
  end

  private

  def filled_out_cells
    @filled_out_cells ||= items.reject(&:empty?)
  end

  def check_for_duplicate_values
    if duplicate_values.any?
      errors.push "duplicate values: #{duplicate_values.to_sentence}"
    end
  end

  def check_for_invalid_values
    if invalid_items.any?
      errors.push "invalid values: #{invalid_items.to_sentence}"
    end
  end

  def duplicate_values
    filled_out_cells
      .group_by { |cell_value| cell_value }
      .select { |cell_value, matching| matching.count > 1 }
      .keys
  end

  def invalid_items
    filled_out_cells.reject(&:valid?)
  end
end
