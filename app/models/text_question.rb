class TextQuestion < Question
  validates :question, :presence => true
  validates :position, :presence => true
  validates :event_id, :presence => true
end