Cell = Struct.new(:value) do
  VALID_RANGE = (1..9)

  delegate :empty?, :to_s, to: :value

  attr_accessor :locked_to_problem
  attr_accessor :error_flag

  def lock_cell
    self.locked_to_problem = true
  end

  def valid?
    VALID_RANGE.include?(value.to_i)
  end
end
