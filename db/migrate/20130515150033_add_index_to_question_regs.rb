class AddIndexToQuestionRegs < ActiveRecord::Migration
  def change
    add_column :text_question_regs, :text_question_id, :integer
    add_column :bool_question_regs, :bool_question_id, :integer
  end
end
