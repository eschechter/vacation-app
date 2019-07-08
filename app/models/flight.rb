class Flight < ApplicationRecord
  belongs_to :origin, class_name: "City"
  belongs_to :destination, class_name: "City"
  has_many :vacation_flights
  has_many :vacations, through: :vacation_flights
  validate :flight_end_must_be_after_flight_start

  def flight_end_must_be_after_flight_start
    if end_time < start_time 
      errors.add(:end_time, "flight end can't be before flight start")
    end
  end

end
