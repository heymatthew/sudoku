require 'rails_helper'
require_relative 'shared_examples'

RSpec.describe SudokuGroup do
  let(:cells) { items.map { |item| Cell.new(item) } }
  subject { SudokuGroup.new(cells) }

  context "with numbers 1-9" do
    let(:items) { %w(1 2 3 4 5 6 7 8 9) }
    include_examples "is #valid?"
  end

  context "with empty values" do
    let(:items) { ['1','','2'] }
    include_examples "is #valid?"
  end

  context "with duplicate values" do
    let(:items) { %w(1 2 2 3) }
    include_examples "is not #valid?", /duplicate.*2/
  end

  context "with invalid values" do
    let(:items) { %w(1 flub 2) }
    include_examples "is not #valid?", /invalid.*flub/
  end
end
