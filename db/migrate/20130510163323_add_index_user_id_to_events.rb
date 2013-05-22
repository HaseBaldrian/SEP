class AddIndexUserIdToEvents < ActiveRecord::Migration
  def up
    drop_table :events
    
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :link
      t.boolean :locked
      t.integer :registration_count
      t.integer :max_registration_count
      t.date :expiry
      t.references :user

      t.timestamps
    end
    
    add_index :events, :user_id
  end

  
  def down
  end
end
