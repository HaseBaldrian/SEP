class Registration < ActiveRecord::Base
  belongs_to :event
  has_many :text_question_regs
  has_many :bool_question_regs
  has_many :opt_question_regs
  
  accepts_nested_attributes_for :text_question_regs, :allow_destroy => true
  accepts_nested_attributes_for :bool_question_regs, :allow_destroy => true
  accepts_nested_attributes_for :opt_question_regs, :allow_destroy => true
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :email, :presence => true, :format => EMAIL_REGEX, 
            :uniqueness => { :scope => :event_id } 
            
  def questions
    questions = self.text_question_regs + self.bool_question_regs + self.opt_question_regs
    return questions.sort_by{ |q| q.position.to_i }
  end
end
