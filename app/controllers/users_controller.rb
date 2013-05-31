class UsersController < ApplicationController
  
  skip_before_filter :authorize
  skip_before_filter :authorize2, :only => [:index, :show, :edit, :update]
  
  def index
    @users = User.order(:name)

    respond_to do |format|
      unless session[:user_id] == 1
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else
        format.html 
      end
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      unless session[:user_id] == 1 || @user.id == session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }      
      else
        format.html 
      end
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html 
    end
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      unless session[:user_id] == 1 || @user.id == session[:user_id] 
        format.html { render :status => 403, :file => "#{Rails.root}/public/403", :layout => false, :status => :forbidden }
      else 
        format.html
      end
    end
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        # neue session eröffnen, also gleich einloggen - dumm, weil sonst session-chaos
        # da nur user mit id==1 user anlegen kann, sofern er eingeloggt ist
        # session[:user_id] = @user.id

        format.html { redirect_to users_url, notice: 'User ' + @user.name + ' erfolgreich erstellt.' }
      else
        format.html { render action: "new" }      
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to user_url(@user), notice: 'Userdaten erfolgreich geaendert.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @id = @user.id
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User geloescht.' }
      format.js
    end
  end
end