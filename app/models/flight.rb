class Flight < ApplicationRecord
  belongs_to :origin, class_name: "City"
  belongs_to :destination, class_name: "City"
  has_many :vacation_flights
  has_many :vacations, through: :vacation_flights
end
