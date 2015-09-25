require 'rails_helper'

RSpec.describe Grid do
  let(:cells_alternating_rows) {
    [
      1, 1, 1,   1, 1, 1,   1, 1, 1,
      2, 2, 2,   2, 2, 2,   2, 2, 2,
      3, 3, 3,   3, 3, 3,   3, 3, 3,

      4, 4, 4,   4, 4, 4,   4, 4, 4,
      5, 5, 5,   5, 5, 5,   5, 5, 5,
      6, 6, 6,   6, 6, 6,   6, 6, 6,

      7, 7, 7,   7, 7, 7,   7, 7, 7,
      8, 8, 8,   8, 8, 8,   8, 8, 8,
      9, 9, 9,   9, 9, 9,   9, 9, 9,
    ]
  }

  let(:cells_alernating_columns) {
    [
      1, 2, 3,   4, 5, 6,   7, 8, 9,
      1, 2, 3,   4, 5, 6,   7, 8, 9,
      1, 2, 3,   4, 5, 6,   7, 8, 9,

      1, 2, 3,   4, 5, 6,   7, 8, 9,
      1, 2, 3,   4, 5, 6,   7, 8, 9,
      1, 2, 3,   4, 5, 6,   7, 8, 9,

      1, 2, 3,   4, 5, 6,   7, 8, 9,
      1, 2, 3,   4, 5, 6,   7, 8, 9,
      1, 2, 3,   4, 5, 6,   7, 8, 9,
    ]
  }

  subject { Grid.new(cells: cells) }

  describe "#cells" do
    context "with 81 members" do
      let(:cells) { [1]*81 }
      it "is #valid?" do
        expect(subject).to be_valid
      end
    end

    context "with fewer members than expected" do
      let(:cells) { [1]*80 }
      it "is not #valid?" do
        expect(subject).to_not be_valid
      end
    end

    context "with more members than expected" do
      let(:cells) { [1]*82 }
      it "is not #valid?" do
        expect(subject).to_not be_valid
      end
    end
  end

  describe "#rows" do
    # TODO stub.
  end

  describe "#columns" do
    # TODO stub.
  end

  describe "#complete" do
    # TODO stub.
  end
end
