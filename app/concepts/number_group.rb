class NumberGroup
  attr_reader :errors
  VALID_NUMBERS = (1..9)

  def initialize(items)
    @items = items
    @errors = []
  end

  def valid?
    if (wrong_item_count?)
      errors.push "need #{expected_length} items in group"
    elsif (has_blank_items?)
      errors.push "group contains blank items"
    elsif (duplicate_items?)
      errors.push "duplicated items found in group"
    elsif (any_invalid_numbers?)
      errors.push "only use numbers 1-9"
    end

    errors.none?
  end

  private

  def has_blank_items?
    blank_items.count > 0
  end

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

  def wrong_item_count?
    @items.length != expected_length
  end

  def duplicate_items?
    @items.uniq.length != @items.length
  end

  def expected_length
    VALID_NUMBERS.to_a.size
  end
end
