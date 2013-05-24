class BoolQuestion < Question  
  validates :option1, :presence => true
  validates :option2, :presence => true
end
