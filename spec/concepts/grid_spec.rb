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

  let(:cells_alternating_columns) {
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

  let(:cells_alternating_subgrids) {
    [
      1, 1, 1,   2, 2, 2,   3, 3, 3,
      1, 1, 1,   2, 2, 2,   3, 3, 3,
      1, 1, 1,   2, 2, 2,   3, 3, 3,

      4, 4, 4,   5, 5, 5,   6, 6, 6,
      4, 4, 4,   5, 5, 5,   6, 6, 6,
      4, 4, 4,   5, 5, 5,   6, 6, 6,

      7, 7, 7,   8, 8, 8,   9, 9, 9,
      7, 7, 7,   8, 8, 8,   9, 9, 9,
      7, 7, 7,   8, 8, 8,   9, 9, 9,
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
    let(:cells) { cells_alternating_rows }

    it "correctly grabs the first row" do
      expect(subject.rows.first).to eq [1]*9
    end

    it "correctly grabs the last row" do
      expect(subject.rows.last).to eq [9]*9
    end
  end

  describe "#columns" do
    let(:cells) { cells_alternating_columns }

    it "correctly grabs the first column" do
      expect(subject.columns.first).to eq [1]*9
    end

    it "correctly grabs the last column" do
      expect(subject.columns.last).to eq [9]*9
    end
  end

  describe "#subgrids" do
    let(:cells) { cells_alternating_subgrids }

    it "correctly grabs the first column" do
      expect(subject.subgrids.first).to eq [1]*9
    end

    it "correctly grabs the last column" do
      expect(subject.subgrids.last).to eq [9]*9
    end
  end

  describe "#complete" do
    context "when some cells are nil" do
      let(:cells) {
        [ 1,2,3,4,5,6,7,8,9,
          nil,nil,nil,nil,nil,nil,nil,nil,nil,
          1,2,3,4,5,6,7,8,9,
          1,2,3,4,5,6,7,8,9,
          1,2,3,4,5,6,7,8,9,
          1,2,3,4,5,6,7,8,9,
          1,2,3,4,5,6,7,8,9,
          nil,nil,nil,nil,nil,nil,nil,nil,nil,
          1,2,3,4,5,6,7,8,9 ]
      }
      it "is not #complete?" do
        expect(subject).to_not be_complete
      end
    end

    context "when all cells are filled out" do
      let(:cells) { cells_alternating_rows }
      it "is #complete?" do
        expect(subject).to be_complete
      end
    end
  end
end
