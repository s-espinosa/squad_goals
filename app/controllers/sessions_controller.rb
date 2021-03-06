class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    self.current_user = @user
    flash[:success] = "Welcome, #{current_user.name}!"
    redirect_to goals_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
