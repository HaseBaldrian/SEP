class CreateBoolQuestions < ActiveRecord::Migration
  def change
    create_table :bool_questions do |t|
      t.string :question
      t.references :event

      t.timestamps
    end
    add_index :bool_questions, :event_id
  end
end
