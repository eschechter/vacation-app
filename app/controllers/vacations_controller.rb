class VacationsController < ApplicationController
  before_action :authorized

  def index
    @vacations = Vacation.where(user_id: user.id)
  end

  def show
    if user.id != Vacation.find(params[:id]).user_id
      redirect_to login_path
    end
    @cities = City.all
    @vacation = Vacation.find(params[:id])
    @most_recent_flight = @vacation.last_vacation_flight
    if @vacation.end_date
      render :show_final
    else
      render :show
    end
  end

  def new
    @vacation = Vacation.new
    @user_id = session[:user_id]
  end

  def create
    @vacation = Vacation.new(vacation_params)
    if @vacation.valid?
      @vacation.save
      redirect_to vacation_path(@vacation)
    else
      render :new
    end
  end

  def finalize
    @vacation = Vacation.find(params[:id])
    @vacation.update(end_date: @vacation.last_flight.end_time.to_date)
    redirect_to vacation_path(@vacation)
  end

  # def add_flight
  #   VacationFlight.create(vacation_id: params[:vacation_id], flight_id: params[:flight_id])
  #   redirect_to vacation_path(params[:vacation_id])
  # end

  # def add_hotel
  #   HotelStay.create(vacation_id: params[:vacation_id], flight_id: params[:flight_id])
  #   redirect_to vacation_path(params[:vacation_id])
  # end

  private

  def vacation_params
    params.require(:vacation).permit(:name, :user_id, :start_date, :end_date)
  end
end
