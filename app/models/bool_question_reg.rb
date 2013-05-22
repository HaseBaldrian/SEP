class BoolQuestionReg < ActiveRecord::Base
  belongs_to :registration
  belongs_to :bool_question
  
  validates :input, :presence => true
end
