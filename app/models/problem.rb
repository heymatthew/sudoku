class Problem < ActiveRecord::Base
  serialize :values, JSON

  validates :values, presence: true, length: { is: Grid::SIZE }

  def grid
    Grid.new(cells: cells)
  end

  private

  def cells
    values.map do |value|
      Cell.new(value: value)
    end
  end
end
