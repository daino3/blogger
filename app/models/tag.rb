class Tag < ActiveRecord::Base
  attr_accessible :name, :blog_category_id

  belongs_to :blog_category
  has_many   :taggings
  has_many   :blog_posts, through: :taggings

  validates_presence_of :blog_category_id
end
