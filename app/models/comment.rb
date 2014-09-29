class Comment < ActiveRecord::Base
  belongs_to :blog_post

  attr_accessible :author, :email, :body, :blog_post_id

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates_presence_of :body
end