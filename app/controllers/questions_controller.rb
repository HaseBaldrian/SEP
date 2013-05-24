class QuestionsController < ApplicationController
  
  def create
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    
    # setup protected attributes
    # evtl in eigene methode umziehen "private def setup_sti"
    model = nil
    opt1 = nil
    opt2 = nil
    opts = nil
    if !params[:question].blank? && !params[:question][:type].blank?
      model = params[:question].delete(:type).constantize.to_s
    end
    if !params[:question].blank? && (!params[:question][:option1].blank? || !params[:question][:option2].blank?)
      opt1 = params[:question].delete(:option1).to_s
      opt2 = params[:question].delete(:option2).to_s
    end
    if !params[:question].blank? && !params[:question][:options].blank?
      opts = params[:question].delete(:options).to_s
    end
    
    #create question (u.U. mit neuen Parametern)
    @q = @event.questions.create(params[:question])   
    @q.type = model
    @q.option1 = opt1
    @q.option2 = opt2
    @q.options = opts

    @questions = @event.questions
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
