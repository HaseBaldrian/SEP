class BoolQuestion < Question  
  validates :question, :presence => true
  validates :position, :presence => true
  validates :event_id, :presence => true
  validates :options, :presence => true
  
  before_update :clear_empty_lines
  
  def clear_empty_lines
    options_new = ""
    
    if self.options
      self.options.each_line do |l|
        unless l.strip.blank?
          options_new += l
        end 
      end
      self.options = options_new
    end
  end
end
