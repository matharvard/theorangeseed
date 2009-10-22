class Link < Post
  validates_presence_of :url
  
  def title
    data[:title]
  end
  
  def title=(value)
    self.data[:title] = value
  end
  
  def url
    data[:url]
  end
  
  def url=(value)
    self.data[:url] = value
  end
  
  def description
    data[:description]
  end
  
  def description=(value)
    self.data[:description] = value
  end
end
