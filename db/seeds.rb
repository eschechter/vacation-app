require "faker"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 10.times do
#   User.create(name: Faker::Name.name)
# end

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

Flight.create!(airline: "American Airlines", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "American Airlines", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "Delta", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "Delta", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "Southwest", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "Southwest", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "JetBlue", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "JetBlue", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "Alaska Airlines", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)
Flight.create!(airline: "United", start_time: Faker::Time.forward(60, :all), end_time: Faker::Time.forward(75, :all), origin: City.all.sample, destination: City.all.sample)

10.times do 
    VacationFlight.create!(vacation: Vacation.all.sample, flight: Flight.all.sample)
end

User.all.each do |user|
  user.email = Faker::Internet.email
  user.save
end

