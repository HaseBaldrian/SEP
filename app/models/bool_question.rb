class BoolQuestion < Question  
  validates :question, :presence => true
  validates :position, :presence => true
  validates :event_id, :presence => true
  validates :option1, :presence => true
  validates :option2, :presence => true
end
