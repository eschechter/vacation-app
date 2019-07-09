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
end
