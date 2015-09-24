require 'rails_helper'

RSpec.describe ProcessedCell do
  let(:cell) { instance_spy("Cell") }
  let(:processed_cell) { ProcessedCell.new(cell) }

  context "Without wrapping in anything else" do
    subject { processed_cell }

    it "has no #errors" do
      expect(subject.errors).to eq []
    end

    it "delegates #value to the cell" do
      subject.value
      expect(cell).to have_received(:value)
    end
  end

  context "when wrapped in ProcessedCellWithRowError" do
    subject { ProcessedCellWithRowError.new(processed_cell) }

    it "has one thing in #errors" do
      expect(subject.errors.size).to be 1
    end

    it "delegates #value to the cell" do
      subject.value
      expect(cell).to have_received(:value)
    end
  end

  context "when wrapperd in ProcessedCellWithSubgridError" do
    subject { ProcessedCellWithSubgridError.new(processed_cell) }

    it "has one thing in #errors" do
      expect(subject.errors.size).to be 1
    end

    it "delegates #value to the cell" do
      subject.value
      expect(cell).to have_received(:value)
    end
  end

  context "when wrapped in ProcessedCellWithRowError and ProcessedCellWithColumnError" do
    let(:cell_with_column_error) { ProcessedCellWithColumnError.new(processed_cell) }
    subject { ProcessedCellWithRowError.new(cell_with_column_error) }

    it "has two things in #errors" do
      expect(subject.errors.size).to be 2
    end

    it "delegates #value to the cell" do
      subject.value
      expect(cell).to have_received(:value)
    end
  end
end
