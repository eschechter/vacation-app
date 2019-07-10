class Vacation < ApplicationRecord
  belongs_to :user
  has_many :hotel_stays
  has_many :hotels, through: :hotel_stays
  has_many :vacation_flights
  has_many :flights, through: :vacation_flights

  def last_vacation_flight
    vacation_flights.max_by do |vac_flight|
      vac_flight.flight.end_time
    end
  end

  def last_flight
    last_vacation_flight&.flight
  end

  def last_hotel_stay
    hotel_stays.max_by(&:check_out_time)
  end

  def need_to_book_hotel?
    if last_hotel_stay.nil? && last_flight.nil?
      return false
    elsif last_hotel_stay.nil?
      return true
    end

    last_hotel_stay.check_out_time < last_flight.end_time
  end

  def first_origin
    flights.min_by(&:start_time)&.origin
  end

  def cur_city
    if last_flight.nil?
      return nil
    end

    last_flight.destination
  end
end
