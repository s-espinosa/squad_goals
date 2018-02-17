class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user=(user)
    session[:user_id] = user.id
  end

  def current_user
    @user ||= User.find(session[:user_id])
  end
end
