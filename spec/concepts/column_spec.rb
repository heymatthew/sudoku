require 'rails_helper'
require_relative 'shared_examples'

RSpec.describe Column do
  let(:column_number) { 2 }
  let(:answer) {
    Answer.new([
      'a',1,1,  1,1,1, 1,1,1,
        2,2,2,  2,2,2, 2,2,2,
        3,3,3,  3,3,3, 3,3,3,

        4,4,4,  4,4,4, 4,4,4,
        5,5,5,  5,5,5, 5,5,5,
        6,6,6,  6,6,6, 6,6,6,

        7,7,7,  7,7,7, 7,7,7,
        8,8,8,  8,8,8, 8,8,8,
        9,9,'a',9,9,9, 9,9,9,
    ])
  }

  subject { Column.new(answer, column_number) }

  context "with valid input" do
    include_examples "is #valid?"

    it "finds the first item as expected" do
      expect(subject.items.first).to eq 1
    end

    it "finds the last item as expected" do
      expect(subject.items.last).to eq 9
    end
  end

  context "with invalid input at start" do
    let(:column_number) { 1 }
    include_examples "is not #valid?", /1-9/
  end

  context "with invalid input at end" do
    let(:column_number) { 3 }
    include_examples "is not #valid?", /1-9/
  end
end
