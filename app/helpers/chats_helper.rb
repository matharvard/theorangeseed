module ChatsHelper
  def formatted_chat(chat)
    simple_format(chat.gsub!(/\w+:/) { |match| match = content_tag(:b, match) })
  end
end
