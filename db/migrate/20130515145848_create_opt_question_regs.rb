class CreateOptQuestionRegs < ActiveRecord::Migration
  def change
    create_table :opt_question_regs do |t|
      t.string :input
      t.references :registration
      t.references :opt_question

      t.timestamps
    end
    add_index :opt_question_regs, :registration_id
    add_index :opt_question_regs, :opt_question_id
  end
end
