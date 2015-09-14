class Problem < ActiveRecord::Base
  DEFAULT_GRID = [[nil]*Grid::WIDTH]*Grid::HEIGHT

  # TODO define serialise functions
  serialize :grid
end
