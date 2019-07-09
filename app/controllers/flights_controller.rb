class FlightsController < ApplicationController
    # before_action :authorized, only: [:search_form, :search]
    
    def show
        @flight = Flight.find(params[:id])
    end
   
    def search_form
       @cities = City.all
    end

    def search
        start = DateTime.new(params[:flight]["start_time(1i)"].to_i, params[:flight]["start_time(2i)"].to_i, params[:flight]["start_time(3i)"].to_i, params[:flight]["start_time(4i)"].to_i, params[:flight]["start_time(5i)"].to_i)
        @searched_flights = Flight.search(params[:flight][:origin_id], params[:flight][:destination_id], start)
    end

    private

    def flight_params
        params.require(:flight).permit(:airline, :start_time, :end_time, :origin, :destination)
    end
end