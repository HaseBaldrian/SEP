class ApplicationController < ActionController::Base
  before_filter :authorize # normaler user
  before_filter :authorize2 # superadmin

  protect_from_forgery
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  def authorize2
    unless session[:user_id] == 19
      redirect_to login_url, :notice => "Please log in as superadmin"
    end
  end  

end