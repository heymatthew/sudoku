# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

namespace :export do
  problems = [
    # Medium difficulty from the internets
    Grid.new([
      nil,  4 ,nil,   2 ,nil,nil,   6 , 8 , 1,
      nil, nil,nil,   3 , 4 ,nil,  nil,nil,nil,
      nil, nil, 2 ,  nil, 7 ,nil,   5 , 3 ,nil,

      nil, nil, 4 ,  nil,nil,nil,   1 , 2 ,nil,
       2,  nil,nil,  nil,nil,nil,  nil,nil, 9,
      nil, 9 , 8 ,   nil,nil,nil,   7 ,nil,nil,

      nil, 8 , 9 ,  nil, 2 ,nil,   4 ,nil,nil,
      nil,nil,nil,  nil, 5 , 9 ,  nil,nil,nil,
       4,  5 , 6 ,  nil,nil, 1 ,  nil, 7 ,nil,
    ]),
  ]

  problems.each do |grid|
    Problem.create!(grid: grid)
  end
end
