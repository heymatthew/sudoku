class Solution
  attr_reader :errors
  attr_reader :grid

  delegate :complete?, to: :grid

  def initialize(cells)
    @grid = Grid.new(cells)
    @errors = []
  end

  def valid?
    check_grid_for_errors
    errors.none?
  end

  protected

  def check_grid_for_errors
    if !grid_checker.call
      errors.push(*grid_checker.errors)
    end
  end

  def grid_checker
    @grid_checker ||= SolutionChecker.new(@grid)
  end
end
