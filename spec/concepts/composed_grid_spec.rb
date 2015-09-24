require 'rails_helper'

RSpec.describe ComposedGrid do
  let(:problem_grid) { instance_double(Grid) }
  let(:submission_grid) { instance_double(Grid) }
  subject { ComposedGrid.new(problem_grid, submission_grid) }

  describe "#rows"
  describe "#columns"
  describe "#subgrids"
end
