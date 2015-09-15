Cell = Struct.new(:value) do
  delegate :to_s, to: :value

  attr_accessor :disabled
  attr_accessor :problem_locked
  attr_accessor :error_flag
end
