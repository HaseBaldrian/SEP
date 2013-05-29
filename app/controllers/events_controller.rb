class EventsController < ApplicationController

  skip_before_filter :authorize
  skip_before_filter :authorize2
  
  #in_place_edit_for :event, :title
  
# wird nirgends(?) verwendet  
#  def count
#    @event = Event.find(params[:id])
#    return @event.text_questions.count + @event.bool_questions.count + @event.opt_quesions.count
#  end

  # GET /events/1
  # GET /events/1.json
  def show
    @user = User.find(params[:user_id])
    @event = Event.find(params[:id])
    @questions = @event.questions
    
    @event.update_attributes(:questions_count => @questions.count)
    
    @event.update_attribute(:locked, true) if @event.expiry < Date.today      

    # questions nach position sortieren
    @questions = @questions.sort_by{ |q| q.position.to_i } 
    i=0
    @questions.each do |q|
      q.update_attributes(:position => i)
      i+=1
    end

    respond_to  do  |format|
      unless session[:user_id] == 19 || @user.id == session[:user_id] 
        format.html { redirect_to users_path, notice: 'Please login as Admin to watch events that are not yours.' }
      else
        format.html # show.html.erb
      end
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @user = User.find(params[:user_id])
    @event = @user.events.new

    respond_to  do  |format|
      unless session[:user_id]
        format.html { redirect_to login_path, notice: 'Please login to create events.' }
      else
        format.html # new.html.erb
      end
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @user = User.find(params[:user_id])
    
  respond_to do |format|
      unless session[:user_id] == 19 || @user.id == session[:user_id] 
        format.js { render :text => "alert('no entry!')" }
        format.html { redirect_to  users_path, notice: 'Please login as Admin to edit events that are not yours.'}
      else 
        format.html
      end
    end
  end

  # POST /events
  # POST /events.json
  def create
    @user = User.find(params[:user_id]) 
    
    detached_params = detach_questions_and_types_params
    questions_params = detached_params.delete('questions')
    type_params = detached_params.delete('types')
    
    # detach_params wieder zu event_params dazu
    if questions_params
      params[:event] = params[:event].merge("questions_attributes" => questions_params)
    end 
    
    @event = @user.events.create(params[:event]) 
    
    questions =  @event.questions 
    i=0
    questions.each do |q|
      q.type = type_params.delete(i.to_s)
      i+=1
    end 

    respond_to do |format|
      if @event.save
        format.html { redirect_to user_event_path(@user, @event), notice: 'Event was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    @user = @event.user_id 

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to user_event_path(@user, @event), notice: 'Event was successfully updated.' }
        format.json { respond_with_bip(@event) }
      else
        format.html { render action: "edit" }
        format.json { respond_with_bip(@event) }
      end
    end
  end
  
  def invert_locked
    @event = Event.find(params[:event_id])
    @user = @event.user_id 
    
    if @event.locked
      @event.update_attributes(:locked => false)
    else
      @event.update_attributes(:locked => true)
    end

    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event) }
      #format.js
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @id = @event.id
    @user = @event.user_id 
    @event.destroy

    respond_to do |format|
      format.html { redirect_to users_path }
      format.js   #destroy.js.erb
    end
  end
  
  def duplicate
    @pattern = Event.find(params[:event_id])
    @pattern_questions = @pattern.questions
    
    @user = User.find_by_id(session[:user_id])
    @event = Event.new
       
    # questions nach position sortieren, position updaten
    @pattern_questions = @pattern_questions.sort_by{ |q| q.position.to_i } 
    i=0
    @pattern_questions.each do |q|
      q.update_attributes(:position => i)
      i+=1
    end
    
    @question_types = []
    
    @pattern_questions.each do |pq|
        @q = @event.questions.build(:question => pq.question, :position => pq.position, :option1 => pq.option1, :option2 => pq.option2, :options => pq.options)
        @question_types[pq.position] = pq.type
    end

    respond_to do |format|
      format.html
    end
  end
  
    private
  
  # questions und types aus params entfernen
  # questions_params: alle attribute ohne :type, {"0" => {...}, "1" => {...}, ...}
  # type_params: alle antwort-typen, {"0" => {:type => TextAnswer}, "1" => {:type => ...}, ...}
  # returns: {"questions" => questions_params, "types" => type_params}       
  def detach_questions_and_types_params
    if !params[:event][:questions_attributes].blank? 
      
      # answers-attributes ablösen
      questions_params = params[:event].delete(:questions_attributes)
      
      # type-attribute der questions rauslösen

      i=0
      q_params = {}
      type_params = {}
      
      questions_params.count.times do 
        question_i = questions_params.delete(i.to_s)
        if !question_i[:type].blank?
          type_i = question_i.delete(:type).constantize.to_s
          type_params.merge!(i.to_s => type_i)
        end
        ##
        q_params.merge!(i.to_s => question_i)
        i+=1
      end

      return {'questions' => q_params}.merge('types' => type_params)
    end
  end
end
