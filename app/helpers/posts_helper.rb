module PostsHelper
  def permalink_for(post)
    content_tag(:div, :class => "permalink") do
      link_to("#", { :controller => "posts",
                     :action => "show",
                     :id => post,
                     :anchor => "#{post.class.to_s.downcase}_#{post.id}" })
    end
  end
end
