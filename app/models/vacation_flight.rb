class VacationFlight < ApplicationRecord
  belongs_to :vacation
  belongs_to :flight

  # def previous_flight
  #   finds the vacation
  #   looks through flights for that vacation and finds one where end time is closest to start time of new flight
  #   takes new flight as parameter
  # end



end
