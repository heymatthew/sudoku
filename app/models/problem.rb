class Problem < ActiveRecord::Base
  # TODO map into GRID :)
  DEFAULT_GRID = [[nil]*9]*9

  # TODO define serialise functions
  serialize :grid
end
