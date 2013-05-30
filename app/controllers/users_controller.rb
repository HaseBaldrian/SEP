class UsersController < ApplicationController
  
  skip_before_filter :authorize
  skip_before_filter :authorize2, :only => [:index, :show, :edit, :update]
  
  # GET /users
  # GET /users.json
  def index
    @users = User.order(:name)

  respond_to  do  |format|
      unless session[:user_id] == 19
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else
        format.html # index.html.erb
      end
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to  do  |format|
      unless session[:user_id] == 19 || @user.id == session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }      
      else
        format.html # show.html.erb
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      unless session[:user_id] == 19 || @user.id == session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else 
        format.html
      end
    end
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # neue session eröffnen, also gleich einloggen
        session[:user_id] = @user.id
        
        #Notifier.registration_received(@user).deliver
        format.html { redirect_to users_url, notice: 'User ' + @user.name + ' was successfully created.' }
      else
        format.html { render action: "new" }      
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @id = @user.id
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully deleted.' }
      format.js #destroy.js.erb
    end
  end
end