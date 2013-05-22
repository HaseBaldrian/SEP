class DeleteTables < ActiveRecord::Migration
  def up
    drop_table :tq_regs
    drop_table :bq_regs
  end

  def down
    create_table :tq_regs do |t|
      t.string :input
      t.references :registration

      t.timestamps
    end
    add_index :bq_regs, :registration_id
    
    create_table :bq_regs do |t|
      t.boolean :input
      t.references :registration

      t.timestamps
    end
    add_index :bq_regs, :registration_id
  end
end
