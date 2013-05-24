class Answer < ActiveRecord::Base
  belongs_to :registration
  belongs_to :question
  
  attr_accessible :position, :registration_id, :question_id, :input
    
  validates :position, :presence => true
  validates :input, :presence => true
end
