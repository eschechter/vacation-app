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
      errors.add(:end_time, "can't be before flight start")
    end
  end

  def different_origin_and_destination
    if origin_id == destination_id
      errors.add(:origin, "must be different than the destination")
    end
  end

  def can_be_added_to_vacation?(vacation)
    (flight.start_time.to_date >= vacation.start_date && flight.end_time.to_date <= vacation.end_date) &&
    (vacation.last_flight.nil? || flight.start_time >= vacation.last_flight.end_time) &&
    (vacation.last_flight.nil? || flight.origin_id == vacation.last_flight.destination_id) &&
    (vacation.last_hotel_stayed_at.nil? || vacation.last_hotel_stayed_at.check_out_time < flight.start_time)
  end

  def self.search(orig_id, dest_id, start)
    start_range = start - 12.hours..start + 12.hours
    Flight.where(origin_id: orig_id, destination_id: dest_id, start_time: start_range)
  end
end
