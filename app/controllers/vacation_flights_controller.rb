class VacationFlightsController < ApplicationController
  def create
    VacationFlight.create(vacation_flight_params)
    redirect_to vacation_path(params[:vacation_flight][:vacation_id])
  end

  def destroy
    vac_flight = VacationFlight.find(params[:id])
    vacation = vac_flight.vacation
    vac_flight.destroy
    redirect_to vacation_path(vacation)
  end

  private

  def vacation_flight_params
    params.require(:vacation_flight).permit(:vacation_id, :flight_id)
  end
end
