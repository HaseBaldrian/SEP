class TextQuestion < ActiveRecord::Base
  belongs_to :event
  has_many :text_question_regs
  
  validates :question, :presence => true
end
