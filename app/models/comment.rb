class Comment < ActiveRecord::Base
  belongs_to :blog_post

  attr_accessible :author, :email, :body, :blog_post_id

end