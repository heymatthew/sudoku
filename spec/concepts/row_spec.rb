require 'rails_helper'
require_relative 'shared_examples'

RSpec.describe Row do
  let(:row_number) { 4 }
  let(:grid) {
    Grid.new([
       1,1,1,   1,1,1,  1,1, 1,  # row 1
       2,3,4,   5,6,7,  8,9,'a', # row 2
       3,3,3,   3,3,3,  3,3, 3,  # row 3

       4,5,6,   7,8,9,  1,2,3,   # row 4
       '5',6,7, 8,9,1,  2,3,'4', # row 5
       6,6,6,   6,6,6,  6,6,6,   # row 6

       7, 7,7,  7,7,7,  7,7,7,   # row 7
      'a',1,2,  3,4,5,  6,7,8,   # row 8
       9 ,9,9,  9,9,9,  9,9,9,   # row 9
    ])
  }

  subject { Row.new(grid, row_number) }

  context "with valid input" do
    include_examples "is #valid?"

    it "shows the first item as expected" do
      expect(subject.items.first).to eq 4
    end

    it "shows the last item as expected" do
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
