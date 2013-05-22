class BoolwertInputToString < ActiveRecord::Migration
  def change
    change_column :bool_question_regs, :input, :string
  end
end
