class VacationsController < ApplicationController
  before_action :authorized

  def index
    @vacations = Vacation.where(user_id: user.id)
  end

  def show
    if user.id != Vacation.find(params[:id]).user_id
      redirect_to login_path
    end
    @vacation = Vacation.find(params[:id])
  end
end
