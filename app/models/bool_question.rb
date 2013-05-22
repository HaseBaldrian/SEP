class BoolQuestion < ActiveRecord::Base
  belongs_to :event
  has_many :bool_question_regs
  
  validates :question, :presence => true
  validates :option1, :presence => true
  validates :option2, :presence => true
end
