class Photo < ActiveRecord::Base
  attr_accessible :url, :title, :url_file_name, :gallery_id, :file_location

  attr_accessor :url_file_name

  has_attached_file :url, :styles => { :medium => "300x300>", :thumb => "150x150>" },
                          :url  => "/assets/images/uploads/:style/:basename.:extension",
                          :path => ":rails_root/app/assets/images/uploads/:style/:basename.:extension"

  do_not_validate_attachment_file_type :url

  validates_presence_of :title, :url

  before_save :set_file_location

  def set_file_location
    self.file_location = "#{self.url}"
  end

  def get_url(options = {})
    type = options[:type] || "original"
    name = File.basename(self.file_location)
    "uploads/#{type}/#{name}"
  end

end