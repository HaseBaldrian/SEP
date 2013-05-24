class Question < ActiveRecord::Base
  belongs_to :event
  # has_many :question_regs
  
  attr_accessible :position, :event_id, :question
  
  validates :question, :presence => true
  validates :position, :presence => true
  validates :event_id, :presence => true
end
