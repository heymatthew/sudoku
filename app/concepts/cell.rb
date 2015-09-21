class Cell
  VALID_RANGE = (1..9)

  delegate :to_s, to: :value

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

  def locked?
    locked
  end

  def valid?
    VALID_RANGE.include?(value)
  end

  def set?
    !value.nil?
  end
end
