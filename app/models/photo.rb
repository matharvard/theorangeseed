class Photo < Post
  has_attached_file :attachment, :styles => { :resized => "400x400>" },
                    :url  => "/assets/attachments/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/attachments/:id/:style/:basename.:extension"
  
  validates_attachment_presence :attachment
  validates_attachment_size :attachment, :less_than => 5.megabytes
  validates_attachment_content_type :attachment, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  def caption
    data[:caption]
  end
  
  def caption=(value)
    self.data[:caption] = value
  end
end
