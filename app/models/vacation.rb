class Vacation < ApplicationRecord
  belongs_to :user
  has_many :hotel_stays
  has_many :hotels, through: :hotel_stays
  has_many :vacation_flights
  has_many :flights, through: :vacation_flights

  def last_flight
    if flights.count == 0
      return nil
    end

    flights.max_by do |flight|
      flight.end_time
    end
  end

  def cur_city
    if last_flight.nil?
      return nil
    end

    last_flight.destination
  end

  def last_hotel_stayed_at
    if hotels.count == 0
      return nil
    end
    hotels.max_by do |hotel|
      hotel.check_out_time
    end
  end
end
