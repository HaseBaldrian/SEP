class ApplicationController < ActionController::Base
  before_filter :authorize # normaler user
  before_filter :authorize2 # superadmin

  protect_from_forgery
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
    end
  end
  
  def authorize2
    unless session[:user_id] == 1
      format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
    end
  end  

end