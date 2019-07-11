class HotelStay < ApplicationRecord
  belongs_to :hotel
  belongs_to :vacation

  validates :check_in_time, :check_out_time, :hotel, presence: true
  validate :stay_end_must_be_after_stay_start
  validate :stay_contained_in_vacation
  validate :stay_must_be_in_current_city
  validate :stay_start_must_be_after_last_flight

  def stay_contained_in_vacation
    if check_in_time && check_in_time.to_date < vacation.start_date
      errors.add(:hotel, "must fit in the vacation's dates.")
    end
  end

  def stay_contained_in_vacation?
    check_in_time.to_date >= vacation.start_date
  end

  def stay_end_must_be_after_stay_start
    if check_out_time && check_in_time && check_out_time < check_in_time
      errors.add(:check_out_time, "can't be before stay beginning.")
    end
  end

  def stay_must_be_in_current_city
    if vacation.cur_city.nil? || hotel&.city != vacation.cur_city
      errors.add(:hotel, "must be in the current city for the vacation.")
    end
  end

  def stay_start_must_be_after_last_flight
    if check_in_time && check_in_time < vacation.last_flight.end_time
      errors.add(:check_in_time, "must be after your last flight lands.")
    end
  end
end
