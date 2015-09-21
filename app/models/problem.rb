require 'json'

class Problem < ActiveRecord::Base
  serialize :values, JSON

  validates :values, {
    presence: true,
    length:   { is: Grid::SIZE }
  }

  composed_of :grid, {
    class_name: "Grid",
    mapping:    [%w(values values)]
  }
end
