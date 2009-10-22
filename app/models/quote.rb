class Quote < Post
  validates_presence_of :body
  
  def body
    data[:body]
  end
  
  def body=(value)
    self.data[:body] = value
  end
  
  def source
    data[:source]
  end
  
  def source=(value)
    self.data[:source] = value
  end
end
