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

    @event.questions.each do |q|
        @a = @registration.answers.build(:question_id => q.id, :position => q.position, :registration_id => @registration)
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
        
    @registration = @event.registrations.create(params[:registration]) 
    
    # TODO opt_answers -> checkboxen

   
    

    respond_to do |format|
      if @registration.save 
            
        # create answers
        i=0
        answers_params.count.times do
          answer_i = answers_params.delete(i.to_s)
          @a = @registration.answers.create(answer_i)
          @a.type = type_params.delete(i.to_s)
          i+=1
        end
        
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
    
    detached_params = detach_answers_and_types_params
    answers_params = detached_params.delete('answers')

    respond_to do |format|
      if @registration.update_attributes(params[:registration])

        # update answers
        i=0
        @registration.sort_answers.each do |a|
          answer_i = answers_params.delete(i.to_s)
          a.update_attributes(answer_i)
          i+=1
        end
        
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
