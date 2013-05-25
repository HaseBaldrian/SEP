class Registration < ActiveRecord::Base
  belongs_to :event
  has_many :answers
  
  accepts_nested_attributes_for :answers, :allow_destroy => true
  
  before_validation :downcase_email
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i
  validates :email, :presence => true, :format => EMAIL_REGEX, 
            :uniqueness => { :scope => :event_id } 
            
  def sort_answers
    answers = self.answers
    return answers.sort_by{ |a| a.position.to_i }
  end
  
  def downcase_email
    self.email.downcase!
  end
  
  def self.to_csv registrations
    firstline = ["EMAIL"]
      registrations.first.answers.each do |answer|
        firstline << answer.question.question.upcase
      end
    
    CSV.generate do |csv|
      csv << firstline
      registrations.each do |registration|
        inputs = [registration.email]
        answers = registration.answers
        answers.each do |answer|
          inputs << answer.input
        end        
        csv << inputs
      end 
    end
  end
end
