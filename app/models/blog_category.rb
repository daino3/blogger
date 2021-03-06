class BlogCategory < ActiveRecord::Base

  attr_accessible :name

  has_many :blog_posts
  has_many :tags

  validates_uniqueness_of :name

  scope :with_published_posts, ->() { where(id: BlogPost.published.pluck(:blog_category_id)) }
end
