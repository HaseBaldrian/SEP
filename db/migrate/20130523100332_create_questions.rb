class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :position
      t.references :event
      t.string :option1
      t.string :option2
      t.string :options
      t.string :type

      t.timestamps
    end
    add_index :questions, :event_id
  end
end
