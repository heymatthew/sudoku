class Cell
  VALID_RANGE = (1..9)

  delegate :to_s, to: :value

  attr_accessor :locked
  attr_accessor :errors
  attr_reader :value

  def value=(new_value)
    return if locked?

    if new_value.match(/\A\d\z/)
      @value = new_value.to_i
    else
      @value = new_value
    end
  end

  def initialize(value)
    @value = value
    @errors = []
  end

  def lock_if_set
    self.locked = true if set?
    self
  end

  def locked?
    locked
  end

  def valid?
    return true if !set?
    VALID_RANGE.include?(value)
  end

  def set?
    !value.nil?
  end
end
