class HotelStay < ApplicationRecord
  belongs_to :hotel
  belongs_to :vacation

  validates :check_in_time, :check_out_time, presence: true

  def hotel_contained_in_vacation
    if check_in_time.to_date < vacation.start_date || check_out_time.to_date > vacation.end_date
      errors.add(:hotel, "must fit in the vacation's dates.")
    end
  end

  def hotel_contained_in_vacation?
    check_in_time.to_date >= vacation.start_date && check_out_time.to_date <= vacation.end_date
  end

  def stay_end_must_be_after_stay_start
    if check_out_time < check_in_time
      errors.add(:check_out_time, "can't be before stay beginning")
    end
  end

  def stay_must_be_in_current_city
    if vacation.cur_city.nil? || hotel.city != vacation.cur_city
      errors.add(:hotel, "must be in the current city for the vacation")
    end
  end
end
