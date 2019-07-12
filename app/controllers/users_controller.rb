class UsersController < ApplicationController
  before_action :authorized, only: [:homepage]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user_id] = user.id
      redirect_to vacations_path(user)
    else
      @user_with_errors = user
      @user = User.new
      render :new
    end
  end

  def homepage
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password)
  end
end
