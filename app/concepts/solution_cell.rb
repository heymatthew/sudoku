class SolutionCell
  delegate :value, :locked, to: :underlying_cell

  attr_reader :underlying_cell, :errors

  def initialize(cell)
    @underlying_cell = cell
    @errors = []
  end
end
