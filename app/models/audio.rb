class Audio < Post
  has_attached_file :attachment,
                    :url  => "/assets/attachments/:id/:basename.:extension",
                    :path => ":rails_root/public/assets/attachments/:id/:basename.:extension"
  
  validates_attachment_presence :attachment
  validates_attachment_size :attachment, :less_than => 10.megabytes
  validates_attachment_content_type :attachment, :content_type => ['audio/mpeg']
  
  def description
    data[:description]
  end
  
  def description=(value)
    self.data[:description] = value
  end
end
