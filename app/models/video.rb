class Video < Post
  validates_presence_of :embed_code
  
  def embed_code
    data[:embed_code]
  end
  
  def embed_code=(value)
    self.data[:embed_code] = value
  end
  
  def caption
    data[:caption]
  end
  
  def caption=(value)
    self.data[:caption] = value
  end
end
