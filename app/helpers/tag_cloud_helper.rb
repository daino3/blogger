module TagCloudHelper

  def tag_cloud(tags, classes)
    max = tags.sort_by { |tag| tag.blog_posts.count }.last
    if max.present? && max.blog_posts.present?
      tags.each do |tag|
        index = (tag.blog_posts.count.to_f / max.blog_posts.count) * (classes.size - 1)
        yield(tag, classes[index.round])
      end
    end
  end

end