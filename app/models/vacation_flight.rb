class VacationFlight < ApplicationRecord
  belongs_to :vacation
  belongs_to :flight

  validate :flight_contained_in_vacation
  validate :flight_will_be_most_recent
  validate :origin_matches_last_destination

  def flight_contained_in_vacation
    if flight.start_time.to_date < vacation.start_date || flight.end_time.to_date > vacation.end_date
      errors.add(:flight, "must fit in the vacation's dates.")
    end
  end

  def flight_contained_in_vacation?
    flight.start_time.to_date >= vacation.start_date && flight.end_time.to_date <= vacation.end_date
  end

  def flight_will_be_most_recent
    if vacation.last_flight && flight.start_time < vacation.last_flight.end_time
      errors.add(:flight, " start time must be later than the last flight's end time.")
    end
  end

  def flight_will_be_most_recent?
    vacation.last_flight.nil? || flight.start_time >= vacation.last_flight.end_time
  end

  def origin_matches_last_destination
    if vacation.last_flight && flight.origin_id != vacation.last_flight.destination_id
      errors.add(:flight, "must start from the same city as the last flight's destination.")
    end
  end

  def origin_matches_last_destination?
    vacation.last_flight.nil? || flight.origin_id == vacation.last_flight.destination_id
  end

  def can_add?
    flight_contained_in_vacation? && flight_will_be_most_recent? && origin_matches_last_destination?
  end
end
