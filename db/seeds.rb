require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

HotelStay.destroy_all
VacationFlight.destroy_all
Vacation.destroy_all
Flight.destroy_all
Hotel.destroy_all
City.destroy_all

city_list = [
  "New York, New York",
  "Los Angeles, California",
  "Chicago, Illinois",
  "Houston, Texas",
  "Phoenix, Arizona",
  "Philadelphia, Pennsylvania",
  "San Antonio, Texas",
  "San Diego, California",
  "Dallas, Texas",
  "San Jose, California",
  "Austin, Texas",
  "Jacksonville, Florida",
  "Fort Worth, Texas",
  "Columbus, Ohio",
  "San Francisco, California",
  "Charlotte, North Carolina",
  "Indianapolis, Indiana",
  "Seattle, Washington",
]

city_list.each do |city_state_string|
  city_name = city_state_string.split(", ")[0]
  state_name = city_state_string.split(", ")[1]
  City.create(name: city_name, state: state_name)
end

120.times do
  Hotel.create(name: "The #{Faker::Name.unique.first_name}", city: City.all.sample)
end

50_000.times do
  start = Faker::Time.forward(150)
  endy = rand(start + 2.hours..start + 10.hours)
  orig = City.all.sample
  dest = City.where.not(id: orig.id).sample
  Flight.create!(airline: "American Airlines", start_time: start, end_time: endy, origin: orig, destination: dest)
end

50_000.times do
  start = Faker::Time.forward(150)
  endy = rand(start + 2.hours..start + 10.hours)
  orig = City.all.sample
  dest = City.where.not(id: orig.id).sample
  Flight.create!(airline: "Delta", start_time: start, end_time: endy, origin: orig, destination: dest)
end

50_000.times do
  start = Faker::Time.forward(150)
  endy = rand(start + 2.hours..start + 10.hours)
  orig = City.all.sample
  dest = City.where.not(id: orig.id).sample
  Flight.create!(airline: "Southwest", start_time: start, end_time: endy, origin: orig, destination: dest)
end
