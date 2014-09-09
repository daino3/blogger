module Taggable
  extend ActiveSupport::Concern

  included do
    def self.tagged_with(name)
      Tag.find_by_name!(name).blog_posts
    end

    def self.tag_counts
      Tag.select("tags.*, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id")
    end

    def tag_list
      tags_array.join(", ")
    end

    def tags_array
      tags.map(&:name)
    end

    def tag_list=(names)
      self.tags = names.split(",").map do |n|
        Tag.where(name: n.strip).first_or_create!
      end
    end
  end

end