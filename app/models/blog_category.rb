class BlogCategory < ActiveRecord::Base

  attr_accessible :name

  has_many :blog_posts
  has_many :tags
end