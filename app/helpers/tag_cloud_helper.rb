module TagCloudHelper

  def tag_cloud(tags, classes)
    max = tags.sort_by { |tag| tag.blog_posts.count }.last
    tags.each do |tag|
      index = (tag.blog_posts.count.to_f / max.blog_posts.count) * (classes.size - 1)
      index = index.is_a?(Integer) ? index : 0
      yield(tag, classes[index.round])
    end
  end

end