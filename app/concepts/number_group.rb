class NumberGroup
  attr_reader :errors
  attr_reader :items

  VALID_NUMBERS = (1..9)

  def initialize(items)
    @items = items
    @errors = []
  end

  def valid?
    if wrong_item_count?
      errors.push "need #{expected_length} items in #{self.class}"
    elsif has_blank_items?
      errors.push "#{self.class} contains blank items"
    elsif duplicate_items?
      errors.push "duplicated items found in #{self.class}"
    elsif any_invalid_numbers?
      errors.push "invalid chars, please only use numbers 1-9 in #{self.class}"
    end

    errors.none?
  end

  private

  def has_blank_items?
    blank_items.count > 0
  end

  def blank_items
    items.select(&:blank?)
  end

  def any_invalid_numbers?
    @items.any? do |item|
      number = item.to_i
      VALID_NUMBERS.exclude?(number)
    end
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
