class Snippet < Post
  validates_presence_of :code
  
  def title
    data[:title]
  end
  
  def title=(value)
    self.data[:title] = value
  end
  
  def code
    data[:code]
  end
  
  def code=(value)
    self.data[:code] = value
  end
end
