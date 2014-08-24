class BlogPost < ActiveRecord::Base

  attr_accessible :title, :body, :published_at

  has_many :comments
end