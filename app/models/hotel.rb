class Hotel < ApplicationRecord
  belongs_to :city
  has_many :hotel_stays
  has_many :vacations, through: :hotel_stays
end
