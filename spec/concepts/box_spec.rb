require 'rails_helper'
require_relative 'shared_examples'

RSpec.describe Box do
  let(:column_number) { 2 }
  let(:row_number) { 2 }
  let(:grid) {
    Grid.new([
       1,  2, 'a', 1,  2,  3, 'a', 1,  2,
       4,  3, 'a', 6,  5,  4, 'a', 4,  3,
      'a','a','a','a','a','a','a','a','a',
       1,  4, 'a', 1,  2,  3, 'a', 1,  4,
       2,  5, 'a', 6,  5,  4, 'a', 2,  5,
       3,  6, 'a', 7,  8,  9, 'a', 3,  6,
      'a','a','a','a','a','a','a','a','a',
       1,  2, 'a', 1,  2,  3, 'a', 1,  2,
       4,  3, 'a', 6,  5,  4, 'a', 4,  3,
    ])
  }

  subject { Box.new(grid, column_number, row_number) }

  context "with valid input" do
    include_examples "is #valid?"
  end

  context "with invalid input" do
    let(:column_number) { 3 }
    let(:row_number) { 3 }
    include_examples "is not #valid?", /duplicated/
  end

  describe "#boxed_start" do
    context "for the first row and column" do
      let(:column_number) { 1 }
      let(:row_number) { 1 }

      it "starts at row index 0" do
        expect(subject.boxed_start).to be 0
      end

      it "ends at row index 2" do
        expect(subject.boxed_end).to be 2
      end
    end

    context "for the last row and column" do
      let(:column_number) { 3 }
      let(:row_number) { 3 }

      it "starts at row index 6" do
        expect(subject.boxed_start).to be 6
      end

      it "starts at row index 8" do
        expect(subject.boxed_end).to be 8
      end
    end
  end
end
