module PostsHelper
  def permalink_for(post)
    content_tag(:div, :class => "permalink") do
      link_to("#", { :controller => "posts",
                     :action => "show",
                     :id => post,
                     :anchor => "#{post.class.to_s.downcase}_#{post.id}" })
    end
  end
  
  def manage_links_for(post)
    edit_post_path = case post
      when Article then edit_article_path(post)
      when Audio   then edit_audio_path(post)
      when Chat    then edit_chat_path(post)
      when Link    then edit_link_path(post)
      when Photo   then edit_photo_path(post)
      when Quote   then edit_quote_path(post)
      when Snippet then edit_snippet_path(post)
      when Video   then edit_video_path(post)
    end
    
    if signed_in?
      content_tag(:div, :class => "manage") do
        link_to("edit", edit_post_path) + " | " + link_to("delete", post_path(post), :method => :delete, :confirm => "Are you sure?")
      end
    end
  end
end
