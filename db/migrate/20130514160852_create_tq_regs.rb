class CreateTqRegs < ActiveRecord::Migration
  def change
    create_table :tq_regs do |t|
      t.string :input
      t.references :registration

      t.timestamps
    end
    add_index :tq_regs, :registration_id
  end
end
