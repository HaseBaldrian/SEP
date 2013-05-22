class RegistrationsController < ApplicationController
  
  skip_before_filter :authorize, :only => [:new, :create, :edit, :update, :show, :destroy]
  skip_before_filter :authorize2, :only => [:new, :create, :edit, :update, :show, :destroy]
  
  def new
    @registration = Registration.new
   
    if (params[:id]) 
      @event = Event.find_by_link(params[:id].downcase) 
    else 
      @event = Event.find(params[:event_id]) 
    end
    
    @user = @event.user
    #TODO was, wenn link unbekannt?
    @questions = @event.text_questions.all + @event.bool_questions.all + @event.opt_questions.all

    # questions nach position sortieren
    @questions = @questions.sort_by{ |q| q.position.to_i } 

    @event.text_questions.each do |tq|
      @registration.text_question_regs.new({:text_question => tq, :position => tq.position})
    end 
      # TODO  @bq_reg = @registration.bool_question_regs.build
      # @oq_reg = @registration.opt_question_regs.build
      
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create
    
    @event = Event.find(params[:event_id])# bzw. find by link, s.o.
    @user = @event.user
    @questions = @event.text_questions.all + @event.bool_questions.all + @event.opt_questions.all
    
    # questions nach position sortieren
    @questions = @questions.sort_by{ |q| q.position.to_i } 

    @registration = @event.registrations.create(params[:registration]) 

    respond_to do |format|
      if @registration.save 
        format.html { redirect_to user_event_registration_path(@user, @event, @registration), notice: 'Registration was successfully created.' }
        format.js #??
      else
        format.html { render action: "new" }
      end
    end
  end
  
  def show
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @registration = Registration.find(params[:id])
    
    @question_regs = @registration.text_question_regs.all + @registration.bool_question_regs.all + @registration.opt_question_regs.all
        # question_regs nach position sortieren
    @question_regs = @question_regs.sort_by{ |q| q.position.to_i } 
    
    respond_to do |format|
      format.html
    end
  end
  
  def index
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @registrations = @event.registrations.all #TODO sort by something? aktuell id
    
    @questions = @event.text_questions.all + @event.bool_questions.all + @event.opt_questions.all
      #questions nach position sortieren    
    @questions = @questions.sort_by{ |q| q.position.to_i } 
    
    respond_to do |format|
      format.html
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @registration = Registration.find(params[:id])
    
   # @questions = @event.text_questions.all + @event.bool_questions.all + @event.opt_questions.all
      #questions nach position sortieren    
    #@questions = @questions.sort_by{ |q| q.position.to_i } 
    
    # @question_regs = @registration.text_question_regs.all + @registration.bool_question_regs.all + @registration.opt_question_regs.all
        # # question_regs nach position sortieren
    # @question_regs = @question_regs.sort_by{ |q| q.position.to_i } 
       
    respond_to do |format|
      format.html
    end
  end
  
  def update
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
        format.html { redirect_to user_event_registration_path(@user, @event, @registration), notice: 'Registration was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @registration = Registration.find(params[:id])
    @registration.destroy
    
    respond_to do |format|
      format.html { redirect_to new_user_event_registration_path(@user,@event), notice: 'Registration was successfully deleted.' }
    end
  end
end
