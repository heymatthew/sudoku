require 'json'

class Problem < ActiveRecord::Base
  serialize :values, JSON

  composed_of :grid, class_name: "Grid", mapping: [%w(values values)]

  validates :values, presence: true, length: { is: Grid::SIZE }
end
