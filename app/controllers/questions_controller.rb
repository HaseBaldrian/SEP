class QuestionsController < ApplicationController
  
  skip_before_filter :authorize
  skip_before_filter :authorize2
  
  def create
    @event = Event.find(params[:event_id])
    @user = @event.user
    
    # setup model-type
    # evtl in eigene methode umziehen "private def setup_sti_type"
    model = nil
    if !params[:question].blank? && !params[:question][:type].blank?
      model = params[:question].delete(:type).constantize.to_s
    end
    
    params[:question].merge!('event_id' => @event.id)
    
    # create weiterreichen an unterklasse, dort wird validiert    
    @q = nil
    
    case model
    when "TextQuestion" then 
      @q = TextQuestion.create(params[:question])
    when "BoolQuestion" then
      @q = BoolQuestion.create(params[:question])
    when "OptQuestion" then
      @q = OptQuestion.create(params[:question])
    end 
    
    # questions nach position sortieren, position updaten
    @questions = @event.update_positions
    
    respond_to do |format|
      if @q.save
            # anzahl der fragen incrementieren
        @event.update_attribute(:questions_count, @event.questions_count+1)
        format.html { redirect_to user_event_path(@user, @event)}
        format.js
      end
    end
  end
  
  def update
    @event = Event.find(params[:event_id])
    @user = @event.user
    @question = Question.find(params[:id])
    
    # update weiterreichen an die passende unterklasse
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
    @user = @event.user
    @question = Question.find(params[:question_id])
    @questions = @event.questions.find(:all, :order => 'position')
    
    current_pos = @question.position
    # falls nicht schon letzter platz
    unless current_pos == @questions.count-1 
      new_pos = current_pos + 1
      update_position current_pos, new_pos
    end
    
    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event) }
      format.js
    end
  end
  
    # position -= 1, "up" weil anschließend weiter oben in der Liste
  def position_up 
    @event = Event.find(params[:event_id])
    @user = @event.user
    @question = Question.find(params[:question_id])
    @questions = @event.questions.find(:all, :order => 'position')
    
    current_pos = @question.position
    # falls nicht schon erster platz
    unless current_pos == 0
      new_pos = current_pos - 1
      update_position current_pos, new_pos
    end 
    
    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event) }
      format.js
    end
  end
  
  def destroy
    @event = Event.find(params[:event_id])
    @user = @event.user
    question = Question.find(params[:id])
      # id fuer q_table-update
    @q_id = question.id
    question.destroy
    
    respond_to do |format|
      format.html { redirect_to user_event_path(@user, @event)}
      format.js
    end
  end
  
  private 
  
  # vertauscht zwei questions der aktuellen position (=die angeklickte) mit der 
  # question auf der neuen position
  def update_position current_pos, new_pos
  @questions = @event.questions.find(:all, :order => 'position') 
    if @questions[new_pos] 
     # andere frage aus dem weg und auf alte position, inklusive answers
      @questions[new_pos].update_attributes(:position => current_pos)
        # answers.position anpassen
      @questions[new_pos].answers.all.each do |a|
        a.update_attributes(:position => current_pos)
      end
      # angeklickte frage auf neue position inklusive answers
      @questions[current_pos].update_attributes(:position => new_pos)
        # answers.position anpassen
      @questions[current_pos].answers.all.each do |a|
        a.update_attributes(:position => new_pos)
      end
    end 
  
  # questions+answers nach neuer position sortieren, position updaten
    @questions = @event.questions.find(:all, :order => 'position') 
    i=0
    @questions.each do |q|
      q.update_attributes(:position => i)
      # answers mitnehmen
      q.answers.all.each do |a|
        a.update_attributes(:position => i)
      end
      i+=1
    end
  end
end
