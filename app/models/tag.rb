class Tag < ActiveRecord::Base
  attr_accessible :name

  belongs_to :blog_category
  has_many   :taggings
  has_many   :blog_posts, through: :taggings
end
