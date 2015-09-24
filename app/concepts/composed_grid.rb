ComposedGrid = Struct.new(:problem_grid, :submission_grid) do
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

  def groups_for(property)
    zipped(property).map do |problem_prop, submission_prop|
      ComposedGroup.new(problem_prop, submission_prop)
    end
  end

  def zipped(property)
    problem_grid.send(property)
      .zip(submission_grid.send(property))
  end
end
