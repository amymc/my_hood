class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_name(params[:name])
  	if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to events_url, :notice => "Logged in!"
    else
      redirect_to sessions_url,  :flash => { :error => "Invalid username or password" }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
