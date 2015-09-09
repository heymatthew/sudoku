class Problem < ActiveRecord::Base
  DEFAULT_GRID = [
    [nil,nil,nil, nil,nil,nil, nil,nil,nil],
    [nil,nil,nil, nil,nil,nil, nil,nil,nil],
    [nil,nil,nil, nil,nil,nil, nil,nil,nil],

    [nil,nil,nil, nil,nil,nil, nil,nil,nil],
    [nil,nil,nil, nil,nil,nil, nil,nil,nil],
    [nil,nil,nil, nil,nil,nil, nil,nil,nil],

    [nil,nil,nil, nil,nil,nil, nil,nil,nil],
    [nil,nil,nil, nil,nil,nil, nil,nil,nil],
    [nil,nil,nil, nil,nil,nil, nil,nil,nil],
  ]

  serialize :grid
end
