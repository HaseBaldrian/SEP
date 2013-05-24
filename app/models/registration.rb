class Registration < ActiveRecord::Base
  belongs_to :event
  has_many :answers
  
  accepts_nested_attributes_for :answers, :allow_destroy => true
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :email, :presence => true, :format => EMAIL_REGEX, 
            :uniqueness => { :scope => :event_id } 
            
  def sort_answers
    answers = self.answers
    return answers.sort_by{ |a| a.position.to_i }
  end
end
