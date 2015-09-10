class NumberGroup
  attr_reader :errors
  VALID_NUMBERS = (1..9)

  def initialize(items)
    @items = items.map(&:to_i)
    @errors = []
  end

  def valid?
    if (too_few_items?)
      errors.push "less than #{expected_length} items in group"
    elsif (duplicate_items?)
      errors.push "duplicated items found in group"
    elsif (any_invalid_numbers?)
      errors.push "only use numbers 1-9"
    end

    errors.none?
  end

  private

  def any_invalid_numbers?
    @items.each do |item|
      if !VALID_NUMBERS.include?(item)
        return true
      end
    end
    false
  end

  def too_few_items?
    @items.length != expected_length
  end

  def duplicate_items?
    @items.uniq.length != @items.length
  end

  def expected_length
    VALID_NUMBERS.to_a.size
  end
end
