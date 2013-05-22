class OptQuestion < ActiveRecord::Base
  belongs_to :event
  has_many :opt_question_regs
  
  validates :question, :presence => true
  validates :options, :presence => true
end
