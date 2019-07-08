class Vacation < ApplicationRecord
  belongs_to :user
  has_many :hotel_stays
  has_many :hotels, through: :hotel_stays
  has_many :vacation_flights
  has_many :flights, through: :vacation_flights
end
