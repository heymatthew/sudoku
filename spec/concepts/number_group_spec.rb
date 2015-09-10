require 'rails_helper'

RSpec.shared_examples "is #valid?" do
  it "is #valid?" do
    expect(subject).to be_valid
  end

  it "has no errors" do
    expect { subject.valid? }
      .to_not change { subject.errors }
      .from([])
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

RSpec.describe NumberGroup do
  let(:list) { [1,2,3,4,5,6,7,8,9] }
  let(:service) { NumberGroup.new(list) }
  subject { service }

  context "list has unique values 1-9" do
    include_examples "is #valid?"
  end

  context "list unique values 1-9 out of order" do
    let(:list) { [6,5,4,3,2,1,9,8,7] }
    include_examples "is #valid?"
  end

  context "has less than 9 numbers" do
    let(:list) { [1,2,3] }
    include_examples "is not #valid?", /9 items/
  end

  context "contains duplicates" do
    let(:list) { [1,2,3,4,5,6,7,8,8] }
    include_examples "is not #valid?", /duplicate/
  end

  context "with numbers < 1" do
    let(:list) { [0,1,2,3,4,5,6,7,8] }
    include_examples "is not #valid?", /1-9/
  end

  context "with numbers > 9" do
    let(:list) { [2,3,4,5,6,7,8,9,10] }
    include_examples "is not #valid?", /1-9/
  end

  context "has numbers as strings" do
    let(:list) { %w(1 2 3 4 5 6 7 8 9) }
    include_examples "is #valid?"
  end

  context "with garbage strings in fields" do
    let(:list) { %w(flubber 2 3 4 5 6 7 8 9) }
    include_examples "is not #valid?", /1-9/
  end

  context "when blanks are submitted in fields" do
    let(:list) { ['', '2', '3', '4', '5', '6', '7', '8', '9'] }
    include_examples "is not #valid?", /blank/
  end

  context "when user submits too many things" do
    let(:list) { ['a']*100 } # because security
    include_examples "is not #valid?", /9 items/
  end
end
