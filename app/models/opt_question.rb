class OptQuestion < Question
  validates :question, :presence => true
  validates :position, :presence => true
  validates :event_id, :presence => true
  validates :options, :presence => true
end
