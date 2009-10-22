class Post < ActiveRecord::Base
  serialize :data
  
  default_scope :order => "created_at DESC"
  
  def day
    self.created_at.beginning_of_day
  end
  
  # def self.serialized_attr_accessor(*args)
  #   args.each do |method_name|
  #     method_declarations = <<<STRING
  #       def #{method_name}
  #         options[:#{method_name}]
  #       end
  #       
  #       def #{method_name}=(value)
  #         self.options[:#{method_name}] = value
  #       end
  #     STRING
  #     
  #     eval method_declarations
  #   end
  # end
end
