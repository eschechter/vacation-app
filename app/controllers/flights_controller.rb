class FlightsController < ApplicationController
  # before_action :authorized, only: [:search_form, :search]

  def show
    @flight = Flight.find(params[:id])
  end

  def search_form
    @cities = City.all
  end

  def search
    @vacation = Vacation.find(params[:id])
    begin
      start = Date.parse(params[:flight][:start_time])
    rescue ArgumentError
      flash[:errors] = ["Please enter a valid date for your flight."]
      redirect_to vacation_path(@vacation)
    else
      flights = Flight.search(params[:flight][:origin_id], params[:flight][:destination_id], start)
      @searched_flights = flights.select do |flight|
        flight.can_be_added_to_vacation?(@vacation)
      end
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:airline, :start_time, :end_time, :origin, :destination)
  end
end
