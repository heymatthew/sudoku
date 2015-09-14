require 'rails_helper'

RSpec.shared_examples "represents passed in cells" do
  it "represents passed in cells" do
    expect(subject.flatten.sort).to eq cells.sort
  end
end

RSpec.describe Grid do
  let(:cells) {
    %w(1 1 1   2 2 2   3 3 3
       1 1 1   2 2 2   3 3 3
       1 1 1   2 2 2   3 3 3

       4 4 4   5 5 5   6 6 6
       4 4 4   5 5 5   6 6 6
       4 4 4   5 5 5   6 6 6

       7 7 7   8 8 8   9 9 9
       7 7 7   8 8 8   9 9 9
       7 7 7   8 8 8   9 9 9)
  }
  let(:grid) { Grid.new(cells) }

  describe "#rows" do
    subject { grid.rows }
    include_examples "represents passed in cells" 

    it "can find the first row" do
      expect(subject.first).to eq %w(1 1 1   2 2 2   3 3 3)
    end

    it "can find the last row" do
      expect(subject.last).to eq %w(7 7 7   8 8 8   9 9 9)
    end
  end

  describe "#columns" do
    subject { grid.columns }
    include_examples "represents passed in cells" 

    it "can find the first column" do
      expect(subject.first).to eq %w(1 1 1   4 4 4   7 7 7)
    end

    it "can find the last column" do
      expect(subject.last).to eq %w(3 3 3    6 6 6    9 9 9)
    end
  end

  describe "#subgrids" do
    subject { grid.subgrids }
    include_examples "represents passed in cells" 

    it "starts with the top left" do
      expect(subject.first).to eq %w(1 1 1
                                     1 1 1
                                     1 1 1)
    end

    it "ends with the bottom right" do
      expect(subject.last).to eq %w(9 9 9
                                    9 9 9
                                    9 9 9)
    end
  end
end
