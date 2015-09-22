class Cell
  # TODO Active model validations?
  VALID_INPUT_RANGE = (1..9)

  delegate :to_s, to: :value

  attr_accessor :locked
  attr_accessor :errors
  attr_reader :value

  def initialize(new_value)
    @value = new_value
    @locked = new_value.present?
    @errors = []
  end

  def value=(new_value)
    return if locked?

    if new_value.match(/\A\d\z/)
      @value = new_value.to_i
    else
      @value = new_value
    end
  end

  def locked?
    locked
  end

  def valid?
    return true if !set?
    VALID_INPUT_RANGE.include?(value)
  end

  def set?
    !value.nil?
  end
end
