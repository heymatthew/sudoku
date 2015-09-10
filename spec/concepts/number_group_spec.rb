require 'rails_helper'

RSpec.shared_examples "is not #valid?" do
  it "is not #valid?" do
    expect(subject).to_not be_valid
  end
end

RSpec.describe NumberGroup do
  let(:list) { [1,2,3,4,5,6,7,8,9] }
  subject { NumberGroup.new(list) }

  context "list has unique values 1-9" do
    it "is #valid?" do
      expect(subject).to be_valid
    end
  end

  context "has less than 9 numbers" do
    let(:list) { [1,2,3] }
    include_examples "is not #valid?"
  end

end
