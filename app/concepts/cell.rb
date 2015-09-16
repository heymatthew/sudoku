Cell = Struct.new(:value) do
  delegate :empty?, :to_s, to: :value

  attr_accessor :locked_to_problem
  attr_accessor :error_flag

  def lock_cell
    self.locked_to_problem = true
  end
end
