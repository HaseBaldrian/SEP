class TextQuestionsController < ApplicationController
# 
  # skip_before_filter :authorize
  # skip_before_filter :authorize2
#   
  # def new
    # @user = User.find(params[:user_id])
    # @event = Event.find(params[:event_id])
    # @textq = @event.text_questions.new
#     
    # respond_to do |format|
      # format.html # new.html.erb
      # format.json { render json: @event }
    # end
  # end
#   
  # def create
    # @event = Event.find(params[:event_id])
    # @user = @event.user_id
    # @textq = @event.text_questions.create(params[:text_question])
    # @tq_id = @textq.id
    # @event_id = @event.id
    # @questions = @event.text_questions + @event.bool_questions + @event.opt_questions
#  
    # # questions nach position sortieren
    # @questions = @questions.sort_by{ |q| q.position.to_i } 
    # i=0
    # @questions.each do |q|
      # q.update_attributes(:position => i)
      # i+=1
    # end
#     
    # @event.update_attribute(:questions_count, @event.questions_count+1)
#     
    # respond_to do |format|
      # format.html { redirect_to  user_event_path(@user, @event)}
      # format.js
    # end
  # end
#   
  # def show
    # @event = Event.find(params[:event_id])
    # @user = @event.user_id
    # redirect_to user_event_path(@user, @event)
  # end
#   
  # def update
    # @event = Event.find(params[:event_id])
    # @user = @event.user_id
    # @question = TextQuestion.find(params[:id])
#     
    # respond_to do |format|
      # if @event.update_attributes(params[:text_question])
        # format.json { respond_with_bip(@question) }
      # else
        # format.json { respond_with_bip(@question) }
      # end
    # end
  # end
#   
  # def destroy
    # @textq = TextQuestion.find(params[:id])
    # @tq_id = @textq.position
    # @event = Event.find(params[:event_id])
    # @user = @event.user_id
    # @textq.destroy
#     
    # respond_to do |format|
      # format.html { redirect_to  user_event_path(@user, @event)}
      # format.js
    # end
  # end
#   
  # def index
    # @event = Event.find(params[:event_id])
    # @user = @event.user_id
    # @textq = TextQuestion.find(params[:id])
    # redirect_to user_event_path(@user, @event)
  # end
end
