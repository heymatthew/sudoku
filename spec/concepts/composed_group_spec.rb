require 'rails_helper'

RSpec.describe ComposedGroup do
  subject { ComposedGroup.new(problem_cells, submitted_cells) }

  def cell_array(value_array)
    value_array.map { |value| Cell.new(value) }
  end

  context "when problem specifies values in cells" do
    let(:problem_cells) { cell_array([1,2,3,4,5,6,7,8,9]) }

    context "when user submits same values over problem cells" do
      let(:submitted_cells) { cell_array(%w(1 2 3 4 5 6 7 8 9)) }
      it "serves up problem's cells" do
        expect(subject.cells).to eq problem_cells
      end
    end

    context "when user submits new values for problem cells" do
      let(:submitted_cells) { cell_array(%w(9 1 2 3 4 5 6 7 8)) }
      it "explodes and calls you a cheater" do
        expect { subject.cells }.to raise_error(ArgumentError)
      end
    end
  end

  context "when problem doesn't specify values" do
    let(:problem_cells) { cell_array([nil]*9) }

    context "when user submits mixed blank and filled out values" do
      let(:submitted_cells) { cell_array([nil]*9) }
      it "preferrs the submission" do
        expect(subject.cells).to eq submitted_cells
      end
    end

    context "when user submits new values for problem cells" do
      context "without #duplicates? values" do
        let(:submitted_cells) { cell_array(%w(1 2 3 4 5 6 7 8 9)) }
        it "does not flag duplicates" do
          expect(subject).to_not have_duplicates
        end
      end

      context "with #duplicates? values" do
        let(:submitted_cells) { cell_array(%w(9 2 3 4 5 6 7 8 9)) }

        it "flags with duplicates" do
          expect(subject).to have_duplicates
        end

        it "corectly lists duplicates" do
          expect(subject.duplicates).to eq %w(9)
        end
      end
    end

  end
end
