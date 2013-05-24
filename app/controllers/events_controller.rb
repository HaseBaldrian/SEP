class EventsController < ApplicationController

  skip_before_filter :authorize
  skip_before_filter :authorize2
  
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
    logger.info @questions.inspect
    
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
    @event = @user.events.create(params[:event])    

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
      else
        format.html { render action: "edit" }
      end
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
    @pattern_questions = []
    @pattern_questions = @pattern.text_questions + @pattern.bool_questions + @pattern.opt_questions
   
    # questions nach position sortieren
    @pattern_questions = @pattern_questions.sort_by{ |q| q.position.to_i } 

    @user = User.find_by_id(session[:user_id])
    @event = Event.new
    
     @tq = @event.text_questions.build
     @bq = @event.bool_questions.build
     @oq = @event.opt_questions.build
    
    respond_to do |format|
      format.html
    end
  end
end
