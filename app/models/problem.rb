class Problem < ActiveRecord::Base
  DEFAULT_GRID = [[nil]*9]*9

  serialize :grid
end
