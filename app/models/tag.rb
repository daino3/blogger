class Tag < ActiveRecord::Base
  include Searchable
  extend FriendlyId

  friendly_id :name, use: :slugged

  attr_accessible :name, :blog_category_id

  belongs_to :blog_category
  has_many   :taggings
  has_many   :blog_posts, through: :taggings

  validates_presence_of :blog_category_id

  settings do
    mappings do
      indexes :id, :index => :no
      # Search these fields
      indexes :name, :analyzer => 'snowball'
    end
  end
end
