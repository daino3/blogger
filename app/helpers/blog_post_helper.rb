module BlogPostHelper
  def highlight(post, attribute)
    attribute = (post.send("hi_#{attribute.to_s}") || post.send(attribute))
    text = attribute.is_a?(String) ? attribute : attribute.join("\n")
    text.html_safe
  end

end
