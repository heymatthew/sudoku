class Cell
  VALID_RANGE = (1..9)

  delegate :empty?, :to_s, to: :value

  attr_accessor :locked
  attr_accessor :errors
  attr_accessor :value

  def initialize(value)
    @value = value
    @errors = []
  end

  def lock_if_set
    self.locked = true if set?
    self
  end

  def valid?
    VALID_RANGE.include?(value.to_i)
  end

  def set?
    !value.nil? && !value.empty?
  end
end
