class SessionsController < ApplicationController

  
  def create
    newuser = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = newuser.id
    redirect_to issues_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
