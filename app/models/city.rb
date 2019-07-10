class City < ApplicationRecord
  has_many :flights_from, class_name: "Flight", foreign_key: "origin_id"
  has_many :flights_to, class_name: "Flight", foreign_key: "destination_id"
  has_many :hotels
end
