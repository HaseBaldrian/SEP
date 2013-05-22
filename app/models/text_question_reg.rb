class TextQuestionReg < ActiveRecord::Base
  belongs_to :registration
  belongs_to :text_question
  
  validates :input, :presence => true
end
