class OptAnswer < Answer
  
  def to_html
    input_new = ""
    if self.input
      self.input.each_line do |l|
        unless l.strip.blank? # heißt: ist leerzeile
          input_new += l.strip + "<br />"
        end
      end
    end
    return input_new
  end
end