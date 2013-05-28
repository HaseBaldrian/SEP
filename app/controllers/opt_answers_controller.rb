class OptAnswersController < ApplicationController
    def update
    @answer = Answer.find(params[:id])
    # TODO richtige params ... 

    respond_to do |format|
      if @answer.update_attributes(params[:opt_answer])
        format.json { respond_with_bip(@answer) }
      else
        format.json { respond_with_bip(@answer) }
      end
    end
  end
end
