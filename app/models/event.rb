class Event < ActiveRecord::Base
  belongs_to :user
  has_many :questions, :dependent => :destroy
  has_many :registrations, :dependent => :destroy
  
  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true
  
  accepts_nested_attributes_for :questions, :allow_destroy => true

  before_create :default_locked
  before_update :default_values
  before_update :link_matching
  
  def default_locked
    self.locked = true
  end
  
  def default_values
    self.max_registration_count ||= -1
    self.questions_count ||= 0
  end
  
  def link_matching
    self.link = self.title.tr(' ','_')
    self.link = self.link.downcase
  end
  
  def description_to_html
    description_new = ""
    if self.description
      self.description.each_line do |l|
        description_new += l.strip + "<br />"
      end
    end
    return description_new
  end
  
  # sortiert alle questions nach position und setzt die positionen neu, iteriert
  def update_positions
    questions = self.questions.find(:all, :order => 'position')
    i=0
    questions.each do |q|
      q.update_attributes(:position => i)
      i+=1
    end 
    return self.questions.find(:all, :order => 'position')
  end
end
