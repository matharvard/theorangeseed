module ChatsHelper
  def format_chat(chat)
    simple_format(chat.gsub!(/\w+:/) { |match| match = content_tag(:b, match) })
  end
end
