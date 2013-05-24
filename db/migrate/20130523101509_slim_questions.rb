class SlimQuestions < ActiveRecord::Migration
  def up  
    remove_column :text_questions, :event_id
    remove_column :text_questions, :position
    remove_column :text_questions, :question 
    
    remove_column :bool_questions, :event_id
    remove_column :bool_questions, :position
    remove_column :bool_questions, :question 
      
    remove_column :opt_questions, :event_id
    remove_column :opt_questions, :position
    remove_column :opt_questions, :question 
  end

  def down
  end
end
