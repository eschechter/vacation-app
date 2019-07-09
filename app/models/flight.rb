class Flight < ApplicationRecord
  belongs_to :origin, class_name: "City"
  belongs_to :destination, class_name: "City"

  has_many :vacation_flights
  has_many :vacations, through: :vacation_flights

  validates :start_time, :end_time, presence: true

  validate :flight_end_must_be_after_flight_start
  validate :different_origin_and_destination

  def flight_end_must_be_after_flight_start
    if end_time < start_time
      puts [airline, start_time, end_time]
      errors.add(:end_time, "can't be before flight start")
    end
  end

  def different_origin_and_destination
    if origin_id == destination_id
      errors.add(:origin, "must be different than the destination")
    end
  end
end
