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
  end

  def new
    @vacation = Vacation.new
    @user_id = session[:user_id]
  end

  def create
    @vac = Vacation.create(vacation_params)
    redirect_to vacation_path(@vac)
  end

  def add_flight
    VacationFlight.create(vacation_id: params[:vacation_id], flight_id: params[:flight_id])
    redirect_to vacation_path(params[:vacation_id])
  end

  private

  def vacation_params
    params.require(:vacation).permit(:name, :user_id, :start_date, :end_date)
  end
end
