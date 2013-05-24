class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :input
      t.references :registration
      t.references :question 
      t.string :type
      t.integer :position

      t.timestamps
    end
    add_index :answers, :registration_id
    add_index :answers, :question_id
  end
end
