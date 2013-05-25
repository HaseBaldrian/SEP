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
    @questions = @event.questions
    
    # questions nach position sortieren
    @questions = @questions.sort_by{ |q| q.position.to_i } 

    @questions.each do |q|
        @a = @registration.answers.build(:question_id => q.id, :position => q.position)
    end
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create
    
    @event = Event.find(params[:event_id])# bzw. find by link, s.o.
    @user = @event.user
    @questions = @event.questions.sort_by{ |q| q.position.to_i }
    
    detached_params = detach_answers_and_types_params
    answers_params = detached_params.delete('answers')
    type_params = detached_params.delete('types')
    
    # detach_params wieder zu registration_params dazu
    if answers_params
      params[:registration] = params[:registration].merge("answers_attributes" => answers_params)
    end 
    
    @registration = @event.registrations.create(params[:registration]) 
    
    answers =  @registration.answers 
    i=0
    answers.each do |a|
      a.type = type_params.delete(i.to_s)
      i+=1
    end 
        
    
    
    # TODO opt_answers -> checkboxen

   
    

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
    
            # answers nach position sortieren
    @answers = @registration.answers
    @answers = @answers.sort_by{ |q| q.position.to_i } 
    
    respond_to do |format|
      format.html
    end
  end
  
  def index
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @registrations = @event.registrations.find(:all, :order => 'created_at') 
        #TODO sort by something? aktuell erstellungsdatum
    
    @questions = @event.questions
      #questions nach position sortieren    
    @questions = @questions.sort_by{ |q| q.position.to_i } 
    
    respond_to do |format|
      format.html
      format.csv { send_data Registration.to_csv(@registrations) }
    end
  end
  
  def edit
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @registration = Registration.find(params[:id])
       
    respond_to do |format|
      format.html
    end
  end
  
def update
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @registration = Registration.find(params[:id])
    
    detached_params = detach_answers_and_types_params
    answers_params = detached_params.delete('answers')
    
    # detach_params wieder zu registration_params dazu
    if answers_params
      params[:registration] = params[:registration].merge("answers_attributes" => answers_params)
    end 

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
    @id = @registration.id
    @registration.destroy
    
    respond_to do |format|
      unless session[:user_id] 
        format.html { redirect_to new_user_event_registration_path(@user,@event), notice: 'Registration was successfully deleted.' } 
      else
        format.html { redirect_to user_event_registrations_path(@user,@event) }
        format.js 
      end
    end
  end
  
  private
  
  # answers und types aus params entfernen
  # answers_params: alle attribute ohne :type, {"0" => {...}, "1" => {...}, ...}
  # type_params: alle antwort-typen, {"0" => {:type => TextAnswer}, "1" => {:type => ...}, ...}
  # returns: {"answers" => ansers_params, "types" => type_params}       
  def detach_answers_and_types_params
    if !params[:registration][:answers_attributes].blank? 
      
      # answers-attributes ablösen
      answers_params = params[:registration].delete(:answers_attributes)
      
      # type-attribute der answers rauslösen

      i=0
      a_params = {}
      type_params = {}
      
      answers_params.count.times do 
        answer_i = answers_params.delete(i.to_s)
        if !answer_i[:type].blank?
          type_i = answer_i.delete(:type).constantize.to_s
          type_params.merge!(i.to_s => type_i)
        end
        a_params.merge!(i.to_s => answer_i)
        i+=1
      end

      return {'answers' => a_params}.merge('types' => type_params)
    end
  end
end
