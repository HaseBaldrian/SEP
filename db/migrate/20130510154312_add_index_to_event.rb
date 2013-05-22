class AddIndexToEvent < ActiveRecord::Migration
  def change
    add_index :events, :id #user_id
  end
end
