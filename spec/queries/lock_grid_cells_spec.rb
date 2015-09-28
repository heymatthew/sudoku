require 'rails_helper'

RSpec.describe LockGridCells do
  let(:values)      { [1, nil] }
  let(:cells)       { values.map { |value| Cell.new(value: value) } }
  let(:sample_grid) { Grid.new(cells: cells) }

  let(:service)  { LockGridCells.new(sample_grid) }
  let(:new_grid) { service.call }

  let(:locked_cell)   { new_grid.cells.first }
  let(:unlocked_cell) { new_grid.cells.last }

  it "constructs an entirely new grid" do
    expect(new_grid).to_not be sample_grid
  end

  it "locks cells" do
    expect(locked_cell.locked).to be true
  end

  it "doesn't lock nil cells" do
    expect(unlocked_cell.locked).to be false
  end
end
