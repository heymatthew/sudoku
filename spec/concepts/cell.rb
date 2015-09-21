require 'rails_helper'

RSpec.describe Cell do
  let(:value) { 9 }
  let(:cell)  { Cell.new(value) }

  let(:guess) { 8 }

  describe "#locked?" do
    before { cell.locked_to_problem = true }

    it "is #locked?" do
      expect(cell).to be_locked
    end

    it "fails on #update_with_guess!" do
      expect(cell.update_with_guess!(guess)).to raise 
    end
  end
end
