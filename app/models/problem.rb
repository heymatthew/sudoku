class Problem < ActiveRecord::Base
  DEFAULT_GRID = [[nil]*9]*9
  GRID_WIDTH = 9
  GRID_HEIGHT = 9

  serialize :grid
end
