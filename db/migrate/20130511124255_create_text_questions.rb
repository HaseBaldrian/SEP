class CreateTextQuestions < ActiveRecord::Migration
  def change
    create_table :text_questions do |t|
      t.string :question
      t.references :event

      t.timestamps
    end
    add_index :text_questions, :event_id
  end
end
