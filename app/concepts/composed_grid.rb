class ComposedGrid
  def initialize(problem_grid, submission_grid)
    @problem_grid, @submission_grid = problem_grid, submission_grid
  end

  def rows
    @rows ||= groups_for(:rows).cells
  end

  def columns
    @columns ||= groups_for(:columns).cells
  end

  def subgrids
    @subgrids ||= groups_for(:subgrids).cells
  end

  private

  def groups_for(group_type)
    zipped_groups(group_type).map do |problem_prop, submission_prop|
      ComposedGroup.new(problem_prop, submission_prop)
    end
  end

  def zipped_groups(group_type)
    problem_grid.send(group_type)
      .zip(submission_grid.send(group_type))
  end
end
