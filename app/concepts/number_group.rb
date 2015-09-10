class NumberGroup
  attr_reader :errors
  VALID_NUMBERS = (1..9)

  def initialize(items)
    @items = items
    @errors = []
  end

  def valid?
    if (blank_items.count > 0)
      errors.push "group contains blank items"
    elsif (too_few_items?)
      errors.push "need #{expected_length} items in group"
    elsif (duplicate_items?)
      errors.push "duplicated items found in group"
    elsif (any_invalid_numbers?)
      errors.push "only use numbers 1-9"
    end

    errors.none?
  end

  private

  def blank_items
    @items.select { |item| item == '' }
  end

  def any_invalid_numbers?
    @items.each do |item|
      number = item.to_i
      if !VALID_NUMBERS.include?(number)
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
