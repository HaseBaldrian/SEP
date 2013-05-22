class AdminController < ApplicationController
   skip_before_filter :authorize2
  
  def index
    @users = User.all
  end
end
