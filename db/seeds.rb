# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

airport_data = CSV.parse(File.read("us-airports.csv"), headers: true)
airport_data.delete(0)
codes_arr = []
airport_data.by_col[13].each do |i|
  codes_arr << i if i
end

codes_arr.each do |code|
  Airport.create(name: code)
end
