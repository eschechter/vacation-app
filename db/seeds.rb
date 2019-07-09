require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

HotelStay.destroy_all
Vacation.destroy_all
Flight.destroy_all
Hotel.destroy_all
City.destroy_all

20.times do
  City.create(name: Faker::Address.city, country: Faker::Address.country)
end

21.times do
  Hotel.create(name: Faker::Dessert.unique.variety, city: City.all.sample)
end

5.times do
  start = Faker::Date.forward(60)
  endy = Faker::Date.between(start, start + 15)
  Vacation.create(start_date: start, end_date: endy, user: User.all.sample)
end

Flight.destroy_all

10.times do
  start = Faker::Time.forward(60)
  endy = rand(start + 2.hours..start + 10.hours)
  orig = City.all.sample
  dest = City.where.not(id: orig.id).sample
  Flight.create!(airline: "American Airlines", start_time: start, end_time: endy, origin: orig, destination: dest)
end

10.times do
  start = Faker::Time.forward(60)
  endy = rand(start + 2.hours..start + 10.hours)
  orig = City.all.sample
  dest = City.where.not(id: orig.id).sample
  Flight.create!(airline: "Delta", start_time: start, end_time: endy, origin: orig, destination: dest)
end

10.times do
  start = Faker::Time.forward(60)
  endy = rand(start + 2.hours..start + 10.hours)
  orig = City.all.sample
  dest = City.where.not(id: orig.id).sample
  Flight.create!(airline: "Southwest", start_time: start, end_time: endy, origin: orig, destination: dest)
end
