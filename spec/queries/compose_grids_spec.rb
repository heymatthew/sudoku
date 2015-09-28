require 'rails_helper'

RSpec.describe ComposeGrids do
  def values_to_cells(values)
    values.map do |value|
      Cell.new(value:value)
    end
  end

  def values_to_grid(values)
    Grid.new(cells: values_to_cells(values))
  end

  let(:problem_values) {
    [
      nil, 1, nil,
      1,  nil,  1,
      nil, 1, nil,
    ]
  }


  let(:submitted_values) {
    [
      2,  1,  2,
      1, nil, 1,
      2,  1,  2,
    ]
  }

  let(:hacked_values) {
    [
      2, 2, 2,
      2, 2, 2,
      2, 2, 2,
    ]
  }

  subject {
    ComposeGrids.new(
      values_to_grid(problem_values),
      values_to_grid(submitted_values)
    )
  }

  it "represents values from submitted grid" do
    combined_values = subject.grid.cells.map(&:value)
    expect(combined_values).to eq submitted_values
  end

  context "when user tries to submit over the top of problem cells" do
    let(:submitted_grid) { bad_grid }

    it "doesn't let you override those cells" do
      combined_values = subject.grid.cells.map(&:value)
      expect(combined_values).to_not eq hacked_values
    end
  end
end
