class ApplicationController < ActionController::Base
  def user
    if session[:user_id]
      User.find(session[:user_id])
    end
  end

  def logged_in?
    !user.nil?
  end

  def authorized
    redirect_to login_path unless logged_in?
  end
end
