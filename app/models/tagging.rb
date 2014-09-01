class Tagging < ActiveRecord::Base
  belongs_to :tag
  belongs_to :blog_post
  
  attr_accessible :tag_id
end
