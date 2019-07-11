class FlightsController < ApplicationController
  # before_action :authorized, only: [:search_form, :search]

  def show
    @flight = Flight.find(params[:id])
  end

  def search_form
    @cities = City.all
  end

  def search
    byebug
    @vacation = Vacation.find(params[:id])
    start = DateTime.parse(params[:flight][:start_time])
    flights = Flight.search(params[:flight][:origin_id], params[:flight][:destination_id], start)
    @searched_flights = flights.select do |flight|
      flight.can_be_added_to_vacation?(@vacation)
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:airline, :start_time, :end_time, :origin, :destination)
  end
end
