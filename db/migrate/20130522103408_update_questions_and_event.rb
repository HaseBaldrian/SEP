class UpdateQuestionsAndEvent < ActiveRecord::Migration
  def change
    change_column :text_questions, :position, :integer
    change_column :bool_questions, :position, :integer
    rename_column :events, :registration_count, :questions_count
  end
end
