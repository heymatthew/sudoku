require 'rails_helper'

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

  def values_for(cells)
    cells.map(&:value)
  end

  context "with too few cells" do
    let(:cells) { ['a']*80 }
    it "raises an error" do
      expect { grid }.to raise_error "impossibru grid construction detected"
    end
  end

  context "with too many cells" do
    let(:cells) { ['a']*82 }
    it "raises an error" do
      expect { grid }.to raise_error "impossibru grid construction detected"
    end
  end

  describe "#rows" do
    subject { grid.rows }

    it "can find the first row" do
      first_row = values_for subject.first
      expect(first_row).to eq %w(1 1 1   2 2 2   3 3 3)
    end

    it "can find the last row" do
      last_row = values_for subject.last
      expect(last_row).to eq %w(7 7 7   8 8 8   9 9 9)
    end
  end

  describe "#columns" do
    subject { grid.columns }

    it "can find the first column" do
      first_column = values_for subject.first
      expect(first_column).to eq %w(1 1 1   4 4 4   7 7 7)
    end

    it "can find the last column" do
      last_column = values_for subject.last
      expect(last_column).to eq %w(3 3 3    6 6 6    9 9 9)
    end
  end

  describe "#subgrids" do
    subject { grid.subgrids }

    it "starts with the top left" do
      top_left = values_for subject.first
      expect(top_left).to eq %w(1 1 1
                                1 1 1
                                1 1 1)
    end

    it "ends with the bottom right" do
      bottom_right = values_for subject.last
      expect(bottom_right).to eq %w(9 9 9
                                    9 9 9
                                    9 9 9)
    end
  end
end
