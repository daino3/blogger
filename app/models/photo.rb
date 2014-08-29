class Photo < ActiveRecord::Base
  belongs_to :gallery
  
  attr_accessible :url, :title, :url_file_name

  attr_accessor :url_file_name

  has_attached_file :url, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
                          :url  => "/assets/images/uploads/:id/:style/:basename.:extension",
                          :path => ":rails_root/app/assets/images/uploads/:id/:style/:basename.:extension"

  do_not_validate_attachment_file_type :url
  # validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end