# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

# seed airports

airport_data = CSV.parse(File.read("us-airports.csv"), headers: true)
airport_data.delete(0)

codes_arr = []
airport_data.by_col[13].each_with_index do |i, index|
  codes_arr << i if i
  break if index == 20
end

codes_arr.each do |code|
  Airport.create(name: code)
end

# seed flights

def time_rand(from = Time.now, to = 1.month.from_now)
  Time.at(from + rand * (to.to_f - from.to_f))
end

def assign_airports(airport_count)
  from_airport_id = rand(airport_count)
  to_airport_id = rand(airport_count)
  if from_airport_id == to_airport_id
    to_airport_id += 1
  end
  [from_airport_id, to_airport_id]
end

3000.times do
  airport_arr = assign_airports(Airport.all.count)
  Flight.create(from_airport_id: airport_arr[0], to_airport_id: airport_arr[1], start_date: time_rand, duration: rand(60..300).to_s)
end
