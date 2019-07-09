require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20.times do
#   City.create(name: Faker::Address.city, country: Faker::Address.country)
# end

# 21.times do
#   Hotel.create(name: Faker::Dessert.unique.variety, city: City.all.sample)
# end

# 100.times do
#   start = Faker::Date.forward(60)
#   endy = Faker::Date.between(start, start + 15)
#   Vacation.create(start_date: start, end_date: endy, user: User.all.sample)
# end

# 200.times do |i|
#   vacay = Vacation.all.sample
#   cur_hotel = Hotel.all.sample

#   other_stays = vacay.hotel_stays

#   while true
#     start_of_stay = Faker::Date.between(vacay.start_date, vacay.end_date)
#     potential_end_of_stay = [start_of_stay + 8, vacay.end_date].min
#     end_of_stay = Faker::Date.between(start_of_stay + 1, potential_end_of_stay)
#     our_range = start_of_stay..end_of_stay

#     other_stays_ranges = other_stays.map do |stay|
#       stay.check_in_time..stay.check_out_time
#     end

#     overlapping = false

#     other_stays_ranges.each do |date_range|
#       if our_range.cover?(date_range.first) || our_range.cover?(date_range.last)
#         overlapping = true
#       end
#     end
#     if !overlapping
#       break
#     end
#   end

#   HotelStay.create(check_in_time: start_of_stay, check_out_time: end_of_stay, vacation: vacay, hotel: cur_hotel)
#   puts i
# end

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
