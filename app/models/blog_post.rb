class BlogPost < ActiveRecord::Base
  include Taggable
  include Searchable
  extend FriendlyId

  friendly_id :title, use: :slugged

  attr_accessible :title,
                  :body,
                  :published_at,
                  :tag_list,
                  :tag_ids,
                  :summary,
                  :blog_category_id,
                  :photo,
                  :published

  belongs_to :blog_category
  belongs_to :author, class_name: "AdminUser", foreign_key: 'admin_user_id'
  has_many :taggings
  has_many :tags, through: :taggings

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "150x150>" },
                            :url  => "/assets/images/uploads/:style/:basename.:extension",
                            :path => ":rails_root/app/assets/images/uploads/:style/:basename.:extension"

  before_save :update_published_at, if: Proc.new { |i| i.published_changed? }

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  scope :recent, ->(*args) { where("created_at > ?", args.first || 6.months.ago ).order("created_at DESC") }
  scope :published, -> { where(published: true) }

  settings do
    mappings do
      indexes :id, :index => :no
      # Search these fields
      indexes :title, analyzer: :english
      indexes :summary, analyzer: :english
      indexes :body, analyzer: :english
      indexes :published_at
      # relationships
      indexes :tag_list, analyzer: :english
    end
  end

  def as_indexed_json(options = {})
     as_json(
       only: [ :id, :created_at, :title, :summary, :body, :published_at ],
       methods: [ :tag_list ]
     )
  end

  def update_published_at
    self.published_at = published ? Time.now : nil
  end
end
