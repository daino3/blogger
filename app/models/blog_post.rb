class BlogPost < ActiveRecord::Base
  include Taggable
  attr_accessible :title, :body, :published_at, :tag_list

  belongs_to :blog_category
  has_many :comments

  scope :recent, ->(arg) { where("created_at > ?", arg ) } 
end