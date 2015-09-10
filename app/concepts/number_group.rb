class NumberGroup
  attr_reader :errors
  VALID_NUMBERS = (1..9)

  def initialize(items)
    @items = items
    @errors = []
  end

  def valid?
    if (too_few_items?)
      errors.push "less than #{expected_length} items in group"
    elsif (duplicate_items?)
      errors.push "duplicated items found in group"
    end

    errors.none?
  end

  private

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
