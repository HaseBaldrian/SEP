class RenameHaschedPassword < ActiveRecord::Migration
  def up
    rename_column :users, :hasched_password, :hashed_password
  end

  def down
  end
end
