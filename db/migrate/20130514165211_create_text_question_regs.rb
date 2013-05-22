class CreateTextQuestionRegs < ActiveRecord::Migration
  def change
    create_table :text_question_regs do |t|
      t.string :input
      t.references :registration

      t.timestamps
    end
    add_index :text_question_regs, :registration_id
  end
end
