class Gallery < ActiveRecord::Base
  has_many :photos

  attr_accessible :title, :photos, :photo, :photos_attributes
  accepts_nested_attributes_for :photos, allow_destroy: true
  validates :url, presence: true
  has_attached_file :url, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end