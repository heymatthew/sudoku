require 'rails_helper'

RSpec.shared_examples "a service with errors" do
  it "responds to #call with failure" do
    expect(subject.call).to be false
  end

  it "sets #errors on #call" do
    expect { subject.call }.to change { subject.errors }.from([])
  end
end

RSpec.describe SolutionChecker do
  subject { SolutionChecker.new(solution) }

  let(:solution) { Solution.new(problem, grid) }
  let(:problem) { instance_double("Problem") }
  let(:grid)  { instance_double("Grid") }

  let(:valid_groups) {
    [
      %w(1 2 3 4 5 6 7 8 9),
      %w(1 2 3 4 5 6 7 8 9),
    ]
  }
  let(:invalid_groups) {
    [
      %w(1 2 3 4 5 6 7 8 9),
      %w(1 2 3 4 kaboom! 6 7 8 9),
      %w(1 2 3 4 5 6 7 8 9),
    ]
  }

  context "when rows, columns and subgrids have valid inputs" do
    before do
      allow(grid).to receive(:rows).and_return(valid_groups)
      allow(grid).to receive(:columns).and_return(valid_groups)
      allow(grid).to receive(:subgrids).and_return(valid_groups)
    end

    it "responds to #call with success" do
      expect(subject.call).to be true
    end

    it "doesn't set #errors" do
      expect { subject.call }.to_not change { subject.errors }.from([])
    end
  end

  context "if rows have errors in them" do
    before do
      allow(grid).to receive(:rows).and_return(invalid_groups)
      allow(grid).to receive(:columns).and_return(valid_groups)
      allow(grid).to receive(:subgrids).and_return(valid_groups)
    end

    include_examples "a service with errors"
  end

  context "if columns have errors in them" do
    before do
      allow(grid).to receive(:rows).and_return(valid_groups)
      allow(grid).to receive(:columns).and_return(invalid_groups)
      allow(grid).to receive(:subgrids).and_return(valid_groups)
    end

    include_examples "a service with errors"
  end

  context "if subgrids have errors in them" do
    before do
      allow(grid).to receive(:rows).and_return(valid_groups)
      allow(grid).to receive(:columns).and_return(valid_groups)
      allow(grid).to receive(:subgrids).and_return(invalid_groups)
    end

    include_examples "a service with errors"
  end
end
