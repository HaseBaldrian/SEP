class SessionsController < ApplicationController
  
  skip_before_filter :authorize
  skip_before_filter :authorize2
  
  def new
  end

  def create
    if user = User.authenticate(params[:name], params[:password])
      session[:user_id] = user.id
      redirect_to user_events_url(user)
    else
      redirect_to login_url, :alert => "Benutzername oder Passwort falsch"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url, :notice => "Erfolgreich abgemeldet"
  end
end
