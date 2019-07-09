class UsersController < ApplicationController
  before_action :authorized, only: [:homepage]

  def new
    @user = User.new
  end

  def create
    session[:user_id] = User.create(user_params).id
    redirect_to vacations_path
  end

  def homepage
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
