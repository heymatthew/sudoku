require 'rails_helper'

RSpec.shared_examples "a service with errors" do
  it "responds to #call with failure" do
    expect(subject.call).to be false
  end
end

RSpec.describe SolutionChecker do
  let(:grid) { instance_double("Grid") }
  subject { SolutionChecker.new(grid) }

  let(:valid_groups) {
    [
      [1, 2, 3, 4, 5, 6, 7, 8, 9].map { |value| Cell.new(value) },
      [1, 2, 3, 4, 5, 6, 7, 8, 9].map { |value| Cell.new(value) },
    ]
  }
  let(:invalid_groups) {
    [
      [1, 2, 3, 4,     5    , 6, 7, 8, 9].map { |value| Cell.new(value) },
      [1, 2, 3, 4, 'kaboom!', 6, 7, 8, 9].map { |value| Cell.new(value) },
      [1, 2, 3, 4,     5    , 6, 7, 8, 9].map { |value| Cell.new(value) },
    ]
  }

  context "when rows, columns and subgrids have valid inputs" do
    before do
      allow(grid).to receive(:rows).and_return(valid_groups)
      allow(grid).to receive(:columns).and_return(valid_groups)
      allow(grid).to receive(:subgrids).and_return(valid_groups)
      allow(grid).to receive(:cells).and_return(valid_groups.flatten)
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
      allow(grid).to receive(:cells).and_return(invalid_groups.flatten)
    end

    include_examples "a service with errors"
  end

  context "if columns have errors in them" do
    before do
      allow(grid).to receive(:rows).and_return(valid_groups)
      allow(grid).to receive(:columns).and_return(invalid_groups)
      allow(grid).to receive(:subgrids).and_return(valid_groups)
      allow(grid).to receive(:cells).and_return(invalid_groups.flatten)
    end

    include_examples "a service with errors"
  end

  context "if subgrids have errors in them" do
    before do
      allow(grid).to receive(:rows).and_return(valid_groups)
      allow(grid).to receive(:columns).and_return(valid_groups)
      allow(grid).to receive(:subgrids).and_return(invalid_groups)
      allow(grid).to receive(:cells).and_return(invalid_groups.flatten)
    end

    include_examples "a service with errors"
  end
end
