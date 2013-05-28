class BoolQuestionsController < ApplicationController
  
  skip_before_filter :authorize
  skip_before_filter :authorize2
  
  def new
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])
    @boolq = @event.bool_questions.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end
  
    def create
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    @boolq = @event.bool_questions.create(params[:bool_question])
    @bq_id = @boolq.id
    @event_id = @event.id
    @questions = @event.text_questions + @event.bool_questions + @event.opt_questions

    # questions nach position sortieren
    @questions = @questions.sort_by{ |q| q.position.to_i } 
    i=0
    @questions.each do |q|
      q.update_attributes(:position => i)
      i+=1
    end
    
    @event.update_attribute(:questions_count, @event.questions_count+1)
    
    respond_to do |format|
      format.html { redirect_to  user_event_path(@user, @event)}
      format.js
    end
  end
  
  def show
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    redirect_to user_event_path(@user, @event)
  end
  
  def update
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    @question = BoolQuestion.find(params[:id])
    
    respond_to do |format|
      if @event.update_attributes(params[:bool_question])
        format.json { respond_with_bip(@question) }
      else
        format.json { respond_with_bip(@question) }
      end
    end
  end
  
  def destroy
    @boolq = BoolQuestion.find(params[:id])
    @bq_id = @boolq.position
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    @boolq.destroy
    
    respond_to do |format|
      format.html { redirect_to  user_event_path(@user, @event)}
      format.js
    end
  end
  
  def index
    @event = Event.find(params[:event_id])
    @user = @event.user_id
    @boolq = BoolQuestion.find(params[:id])
    redirect_to user_event_path(@user, @event)
  end
end
