class HotelStay < ApplicationRecord
  belongs_to :hotel
  belongs_to :vacation
end
