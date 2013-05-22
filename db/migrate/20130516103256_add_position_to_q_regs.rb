class AddPositionToQRegs < ActiveRecord::Migration
  def change
    add_column :text_question_regs, :position, :integer
    add_column :bool_question_regs, :position, :integer
    add_column :opt_question_regs, :position, :integer
  end
end
