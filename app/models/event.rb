# Coding: UTF-8

class Event < ActiveRecord::Base
  belongs_to :user
  has_many :questions, :dependent => :destroy
  has_many :registrations, :dependent => :destroy
  
  validates :title, :presence => true, :uniqueness => true
  validates :description, :presence => true
  validates :max_registration_count, :numericality => { :greater_than_or_equal_to => -1 }
  
  validate :max_reg_count_not_down
  
  accepts_nested_attributes_for :questions, :allow_destroy => true

  before_create :default_locked
  before_update :default_values
  before_update :link_matching
  before_update :inspect_max_registration_count
  
  def default_locked
    self.locked = true
  end
  
  def default_values
    self.max_registration_count ||= -1
    self.questions_count ||= 0
  end
  
  def link_matching
    self.link = self.title.tr(' ','_')
    self.link = self.link.tr('ä', 'ae')
    self.link = self.link.tr('ö', 'oe')
    self.link = self.link.tr('ü', 'ue')
    self.link = self.link.tr('ß', 'ss')
    self.link = self.link.downcase
  end
  
  #Kurzlink /anmeldung ist hier hardcodiert.
  def url
    return "http://" + Rails.application.routes.default_url_options[:host] + "/anmeldung/" +  self.link
  end
  
  def inspect_max_registration_count
        # falls max_registration_count nach oben gesetzt wurde, wartelisten-nachruecker informieren
    registrations = self.registrations.find(:all, :order => 'created_at')
    if self.max_registration_count_was < self.max_registration_count && self.max_registration_count_was != -1 
      i=0
      supremum = [registrations.count,self.max_registration_count].min
      (supremum-max_registration_count_was).times do 
        Notifier.registration_move_up(registrations[max_registration_count_was+i]).deliver
        i+=1
      end
    end
  end
  
  def max_reg_count_not_down
    if self.max_registration_count_was
      if self.max_registration_count != -1
        if (self.max_registration_count_was>self.max_registration_count || self.max_registration_count_was == -1) && self.registrations.count>self.max_registration_count  
            errors.add(:max_registration_count, "can't be set down, there are already registrations confirmed")
            return false
        end
      end
    end
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
