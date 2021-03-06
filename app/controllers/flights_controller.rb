class FlightsController < ApplicationController
  # before_action :authorized, only: [:search]

  def show
    @flight = Flight.find(params[:id])
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
      unsorted_flights = flights.select do |flight|
        flight.can_be_added_to_vacation?(@vacation)
      end

      @searched_flights = unsorted_flights.sort_by do |flight|
        flight.start_time
      end
    end
  end

  private

  def flight_params
    params.require(:flight).permit(:airline, :start_time, :end_time, :origin, :destination)
  end
end
