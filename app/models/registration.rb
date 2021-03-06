class Registration < ActiveRecord::Base
  belongs_to :event
  has_many :answers, :dependent => :destroy
  
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
    unless registrations.empty?
      firstline = ["email"]
        registrations.first.answers.each do |answer|
          firstline << answer.question.question
        end
      
      CSV.generate do |csv|
        csv << firstline
        i=0
        if registrations[0].event.max_registration_count == -1
          count = registrations.count
        else
          count = [registrations[0].event.max_registration_count, registrations.count].min
        end
        count.times do 
          inputs = ["\'" + registrations[i].email+ "\'"]
          answers = registrations[i].answers
          answers.each do |answer|
            if answer.input.nil?
              inputs << "\"" + "\""
            else
              inputs << answer.input
            end
          end        
          i+=1
          csv << inputs
        end 
      end
    end
  end 
end
