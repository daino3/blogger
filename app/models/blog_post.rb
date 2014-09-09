class BlogPost < ActiveRecord::Base
  include Taggable
  include Searchable

  attr_accessible :title,
                  :body,
                  :published_at,
                  :tag_list,
                  :tag_ids,
                  :summary,
                  :blog_category_id,
                  :photo

  belongs_to :blog_category
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "150x150>" },
                            :url  => "/assets/images/uploads/:style/:basename.:extension",
                            :path => ":rails_root/app/assets/images/uploads/:style/:basename.:extension"

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  scope :recent, ->(*args) { where("created_at > ?", args.first || 6.months.ago ).order("created_at DESC") }

  settings do
    mappings do
      indexes :id, :index => :no
      indexes :created_at, :type => 'date', :index => :no
      # Search these fields
      indexes :title, :analyzer => 'snowball'
      indexes :summary, :analyzer => 'snowball'
      indexes :body, :analyzer => 'snowball'
      indexes :published_at
    end
  end
end