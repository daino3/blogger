class BlogCategory < ActiveRecord::Base


  has_many :blog_posts
  has_many :tags
end