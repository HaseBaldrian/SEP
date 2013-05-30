class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :link
      t.boolean :locked
      t.integer :questions_count
      t.integer :max_registration_count
      t.date :expiry
      t.references :user

      t.timestamps
    end
    
    add_index :events, :user_id
  end
end
