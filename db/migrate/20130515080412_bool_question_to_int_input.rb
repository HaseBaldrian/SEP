class BoolQuestionToIntInput < ActiveRecord::Migration
  def change 
    change_column :bool_question_regs, :input, :integer
  end
end
