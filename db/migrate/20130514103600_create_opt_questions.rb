class CreateOptQuestions < ActiveRecord::Migration
  def change
    create_table :opt_questions do |t|
      t.string :question
      t.string :options
      t.integer :position
      t.references :event

      t.timestamps
    end
    add_index :opt_questions, :event_id
    
    add_column :text_questions, :position, :string
    add_column :bool_questions, :position, :string
    end
end
