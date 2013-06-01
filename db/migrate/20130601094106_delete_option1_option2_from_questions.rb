class DeleteOption1Option2FromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :option1
    remove_column :questions, :option2
  end
end
