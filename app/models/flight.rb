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

  def flight_within_vacation?(vacation)
    start_time.to_date >= vacation.start_date
  end

  def flight_is_later_than_last_flights_departure?(vacation)
    vacation.last_flight.nil? || start_time >= vacation.last_flight.end_time
  end

  def origin_is_same_as_last_destination?(vacation)
    vacation.last_flight.nil? || origin_id == vacation.last_flight.destination_id
  end

  def does_not_interfere_with_hotel_stay?(vacation)
    vacation.last_hotel_stay.nil? || vacation.last_hotel_stay.check_out_time < start_time
  end

  def can_be_added_to_vacation?(vacation)
    flight_within_vacation?(vacation) &&
      flight_is_later_than_last_flights_departure?(vacation) &&
      origin_is_same_as_last_destination?(vacation) &&
      does_not_interfere_with_hotel_stay?(vacation)
  end

  def self.search(orig_id, dest_id, start)
    start_range = start - 6.hours..start + 6.hours
    Flight.where(origin_id: orig_id, destination_id: dest_id, start_time: start_range)
  end
end
