class NumberGroup
  attr_reader :errors
  VALID_NUMBERS = (1..9)

  def initialize(items)
    @items = items
    @errors = []
  end

  def valid?
    if ( !correct_length? )
      errors.push "less than #{expected_length} items in group"
    end

    errors.none?
  end

  private

  def correct_length?
    @items.length == expected_length
  end

  def items_unique?
    @items.uniq.length == @items.length
  end

  def expected_length
    @expected_length ||= VALID_NUMBERS.to_a.size
  end
end
