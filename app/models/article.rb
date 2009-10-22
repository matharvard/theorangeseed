class Article < Post
  validates_presence_of :body
  
  def title
    data[:title]
  end
  
  def title=(value)
    self.data[:title] = value
  end
  
  def body
    data[:body]
  end
  
  def body=(value)
    self.data[:body] = value
  end
end
