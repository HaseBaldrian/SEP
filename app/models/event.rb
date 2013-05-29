class Event < ActiveRecord::Base
  belongs_to :user
  has_many :questions, :dependent => :destroy
  has_many :registrations, :dependent => :destroy
  
  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true
  
  accepts_nested_attributes_for :questions, :allow_destroy => true

  
  before_update :default_values
  before_update :link_matching
  
  def default_values
    self.locked ||= false
    self.max_registration_count ||= -1
    self.questions_count ||= 0
  end
  
  def link_matching
    self.link = self.title.tr(' ','_')
    self.link = self.link.downcase
  end
  
end
