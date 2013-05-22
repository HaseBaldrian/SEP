class CreateBoolQuestionRegs < ActiveRecord::Migration
  def change
    create_table :bool_question_regs do |t|
      t.boolean :input
      t.references :registration

      t.timestamps
    end
    add_index :bool_question_regs, :registration_id
  end
end
