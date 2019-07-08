class VacationFlight < ApplicationRecord
  belongs_to :vacation
  belongs_to :flight
end
