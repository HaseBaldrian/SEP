class QuestionsController < ApplicationController
  
  def create
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    
    # setup model-type
    # evtl in eigene methode umziehen "private def setup_sti_type"
    model = nil
    if !params[:question].blank? && !params[:question][:type].blank?
      model = params[:question].delete(:type).constantize.to_s
    end
    
    params[:question].merge!('event_id' => @event.id)
   
    #create question (u.U. mit neuen Parametern)
    # @q = @event.questions.create(params[:question])   
    # @q.type = model
    
    @q = nil
    
    case model
    when "TextQuestion" then begin
      @q = TextQuestion.create(params[:question])
      logger.info "hallo!"
    end
    when "BoolQuestion" then
      @q = BoolQuestion.create(params[:question])
    when "OptQuestion" then
      @q = OptQuestion.create(params[:question])
    end 
    
    
    @questions = @event.questions.all
   # logger.info "loggerinfo: "+@questions.inspect
    
    # questions nach position sortieren
    @questions = @questions.sort_by{ |q| q.position.to_i } 
    i=0
    @questions.each do |q|
      q.update_attributes(:position => i)
      i+=1
    end
    
   # logger.info "loggerinfo2: "+@questions.inspect
    
    @event.update_attribute(:questions_count, @event.questions_count+1)
    
    respond_to do |format|
      if @q.save
        format.html { redirect_to user_event_path(@user, @event)}
        format.js
      end
    end
  end
  
  def update
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    @question = Question.find(params[:id])
    
    case @question.type
    when "TextQuestion" then       
      TextQuestion.update(@question, params[:text_question])
    when "BoolQuestion" then
      BoolQuestion.update(@question, params[:bool_question])
    when "OptQuestion" then
      OptQuestion.update(@question, params[:opt_question])
    end  
    
    respond_to do |format|
      if @event.update_attributes(params[:question])
        format.json { respond_with_bip(@question) }
      else
        format.json { respond_with_bip(@question) }
      end
    end
  end
  
  # position += 1, "down" weil anschließend weiter unten in der Liste
  def position_down 
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    @question = Question.find(params[:question_id])
    
    current_pos = @question.position
    new_pos = current_pos + 1
    @questions = @event.questions.find(:all, :order => 'position') 
    if @questions[new_pos] 
      @questions[new_pos].update_attributes(:position => current_pos)
      @question.update_attributes(:position => new_pos)
    end 
    
  # questions nach neuer position sortieren
    @questions = @event.questions.find(:all, :order => 'position') 
    i=0
    @questions.each do |q|
      q.update_attributes(:position => i)
      i+=1
    end
    
    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event) }
      format.js
    end
  end
  
    # position -= 1, "up" weil anschließend weiter oben in der Liste
  def position_up 
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    @question = Question.find(params[:question_id])
    
    current_pos = @question.position
    unless current_pos == 0
      new_pos = current_pos - 1
      logger.info "new_pos: " + new_pos.inspect
      @questions = @event.questions.find(:all, :order => 'position') 
      if @questions[new_pos] 
        @questions[new_pos].update_attributes(:position => current_pos)
        @question.update_attributes(:position => new_pos)
      end 
    end 
    
  # questions nach neuer position sortieren
    @questions = @event.questions.find(:all, :order => 'position') 
    i=0
    @questions.each do |q|
      q.update_attributes(:position => i)
      i+=1
    end
    
    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event) }
      format.js
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @user = User.find(params[:user_id])
    @question = Question.find(params[:id])
    @q_id = @question.id
    @question.destroy
    
    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event)}
      format.js
    end
  end
  
end
