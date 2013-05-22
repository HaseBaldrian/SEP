class OptQuestionReg < ActiveRecord::Base
  belongs_to :registration
  belongs_to :opt_question
  
  validates :input, :presence => true
end
