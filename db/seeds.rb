# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namespace :export do
  Problem.create!(values: [
    nil,  4 ,nil,   2 ,nil,nil,   6 , 8 , 1,
    nil, nil,nil,   3 , 4 ,nil,  nil,nil,nil,
    nil, nil, 2 ,  nil, 7 ,nil,   5 , 3 ,nil,

    nil, nil, 4 ,  nil,nil,nil,   1 , 2 ,nil,
     2,  nil,nil,  nil,nil,nil,  nil,nil, 9,
    nil, 9 , 8 ,   nil,nil,nil,   7 ,nil,nil,

    nil, 8 , 9 ,  nil, 2 ,nil,    4 ,nil,nil,
    nil,nil,nil,  nil, 5 , 9 ,   nil,nil,nil,
     4,  5 , 6 ,  nil,nil, 1 ,   nil, 7 ,nil,
  ])

  Problem.create!(values: [
    8, 2, 4,   9,  5,  3,   6, 7, 1,
    6, 3, 5,   8,  1,  7,   9, 2, 4,
    7, 1, 9,   6,  2,  4,   8, 5, 3,

    5, 8, 7,   2,  9,  1,   3, 4, 6,
    1, 4, 2,   7, nil, 6,   5, 8, 9,
    3, 9, 6,   4,  8,  5,   2, 1, 7,

    2, 6, 1,   5,  4,  9,   7, 3, 8,
    4, 7, 8,   3,  6,  2,   1, 9, 5,
    9, 5, 3,   1,  7,  8,   4, 6, 2
  ])
end
