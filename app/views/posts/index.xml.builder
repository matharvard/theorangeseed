xml.instruct!(:xml, :version => "1.0") 
xml.rss(:version => "2.0") do
  xml.channel do
    xml.title("The Orange Seed")
    xml.description("Posts")
    xml.link(posts_url)
    
    Post.find(:all, :limit => 25).each do |post|
      xml.item do
        case post
          when Article
            xml.title(post.title)
            xml.description(post.body)
          when Audio
            xml.title(post.description)
            xml.description(post.description)
          when Chat
            xml.title(post.title)
            xml.description(format_chat(post.body))
          when Link
            xml.title(post.url)
            xml.description(post.description)
          when Photo
            xml.title(post.caption)
            xml.description(image_tag(post.attachment.url(:resized)))
          when Quote
            xml.title(post.body)
            xml.description(post.source)
          when Snippet
            xml.title(post.title)
            xml.description(content_tag(:pre, content_tag(:code, post.code)))
          when Video
            xml.title(post.caption)
            xml.description(post.embed_code)
        end
        
        xml.pubDate(post.created_at.to_s(:rfc822))
        xml.link(post_url(post))
        xml.guid(post_url(post))
      end
    end
  end
end
