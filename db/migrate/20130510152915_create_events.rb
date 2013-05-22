class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :link
      t.boolean :locked
      t.integer :registration_count
      t.integer :max_registration_count
      t.date :expiry

      t.timestamps
    end
  end
end
