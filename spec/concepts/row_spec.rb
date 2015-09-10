require 'rails_helper'

RSpec.describe Row do
  let(:row_number) { 4 }
  let(:grid) {
    [
       1,1,1, 1,1,1, 1,1,1,
       2,2,2, 2,2,2, 2,2,'invalid',
       3,3,3, 3,3,3, 3,3,3,

       4,5,6, 7,8,9, 1,2,3,
       '5','5','5', '5','5','5', '5','5','5',
       6,6,6, 6,6,6, 6,6,6,

       7,7,7, 7,7,7, 7,7,7,
       'invalid',8,8, 8,8,8, 8,8,8,
       9,9,9, 9,9,9, 9,9,9,
    ]
  }

  subject { Row.new(grid, row_number) }

  context "when the row has 4s" do
    it "is #valid?" do
      expect(subject).to be_valid
    end

    it "has no errors" do
      expect { subject.valid? }.to_not change { subject.errors }.from([])
    end

    it "starts with a 4" do
      expect(subject.items.first).to eq 4
    end

    it "ends with a 3" do
      expect(subject.items.last).to eq 3
    end
  end
end
