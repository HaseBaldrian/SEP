class CreateRegistrations < ActiveRecord::Migration
  def change
    create_table :registrations do |t|
      t.string :email
      t.references :event

      t.timestamps
    end
    add_index :registrations, :event_id
  end
end
