SudokuGroup = Struct.new(:items) do
  VALID_RANGE = (1..9)

  attr_accessor :errors

  def valid?
    errors = []
    errors.push(*empty_errors)
    errors.push(*duplicate_errors)
    errors.push(*invalid_errors)

    errors.none?
  end

  def empty_items?
    items.select(&:empty?).size > 0
  end

  def duplicate_items?
    items.count != items.uniq.count
  end

  def invalid_items?
    items.select { |item| VALID_RANGE.include?(item.to_i) }
  end
end
