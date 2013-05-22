class ChangeBoolQuestionToWork < ActiveRecord::Migration
  def change
    add_column :bool_questions, :option1, :string 
    add_column :bool_questions, :option2, :string
  end
end
