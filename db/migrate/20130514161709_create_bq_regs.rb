class CreateBqRegs < ActiveRecord::Migration
  def change
    create_table :bq_regs do |t|
      t.boolean :input
      t.references :registration

      t.timestamps
    end
    add_index :bq_regs, :registration_id
  end
end
