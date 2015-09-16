class Cell
  VALID_RANGE = (1..9)

  delegate :empty?, :to_s, to: :value

  attr_accessor :locked_to_problem
  attr_accessor :errors
  attr_accessor :value

  def initialize(value)
    @value = value
    @errors = []
  end

  def lock_cell
    self.locked_to_problem = true
  end

  def valid?
    VALID_RANGE.include?(value.to_i)
  end
end
