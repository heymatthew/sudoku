require 'rails_helper'

RSpec.shared_examples "is #valid?" do
  it "is #valid?" do
    expect(subject).to be_valid
  end

  it "has no errors" do
    expect { subject.valid? }.to_not change { subject.errors }.from([])
  end
end

RSpec.shared_examples "is not #valid?" do |expected_error_regex|
  it "is not #valid?" do
    expect(subject).to_not be_valid
  end

  it "has a sensible error" do
    expect { subject.valid? }
      .to change { subject.errors }
      .to include expected_error_regex
  end
end

RSpec.describe Row do
  let(:row_number) { 4 }
  let(:grid) {
    [
       1,1,1,   1,1,1,   1,1,1,          # row 1
       2,3,4,   5,6,7,   8,9,'invalid',  # row 2
       3,3,3,   3,3,3,   3,3,3,          # row 3

       4,5,6,   7,8,9,   1,2,3,    # row 4
       '5',6,7, 8,9,1,   2,3,'4',  # row 5
       6,6,6,   6,6,6,   6,6,6,    # row 6

       7,7,7,   7,7,7,   7,7,7,    # row 7
       'invalid',1,2,3,4,5,6,7,8,  # row 8
       9,9,9,   9,9,9,   9,9,9,    # row 9
    ]
  }

  subject { Row.new(grid, row_number) }

  context "when the row has 4s" do
    include_examples "is #valid?"

    it "starts with a 4" do
      expect(subject.items.first).to eq 4
    end

    it "ends with a 3" do
      expect(subject.items.last).to eq 3
    end
  end

  context "for rows with string values" do
    let(:row_number) { 5 }
    include_examples "is #valid?"
  end

  context "rows that start with invalid input" do
    let(:row_number) { 8 }
    include_examples "is not #valid?", /1-9/
  end

  context "rows that start with invalid input" do
    let(:row_number) { 2 }
    include_examples "is not #valid?", /1-9/
  end
end
