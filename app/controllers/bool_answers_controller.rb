class BoolAnswersController < ApplicationController
    def update
    @answer = Answer.find(params[:id])
    # option1 = true
    
    bool = false
    
    if !params[:bool_answer][:input].blank?
      bool = params[:bool_answer].delete(:input)
      if bool
        # option1
        params[:bool_answer].merge!('input' => @answer.question.option1)
      else
        # option2
        params[:bool_answer].merge!('input' => @answer.question.option2)
      end     
    end
    logger.info "params: " + params.inspect

    respond_to do |format|
      if @answer.update_attributes(params[:bool_answer])
        format.json { respond_with_bip(@answer) }
      else
        format.json { respond_with_bip(@answer) }
      end
    end
  end
end
