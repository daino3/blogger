module BlogPostHelper
  def highlight(post, attribute)
    display = ''
    if post.respond_to?("hi_#{attribute.to_s}")
      display = (post.send("hi_#{attribute.to_s}") || post.send(attribute))
    else
      display = post.send(attribute)
    end
    text = display.is_a?(String) ? display : display.join("\n")
    text.html_safe
  end

end
