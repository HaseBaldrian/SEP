class Question < ActiveRecord::Base
  belongs_to :event
  has_many :answers
  
  attr_accessible :position, :event_id, :question, :option1, :option2, :options
  
  validates :question, :presence => true
  validates :position, :presence => true
  validates :event_id, :presence => true
end
