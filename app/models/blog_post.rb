class BlogPost < ActiveRecord::Base
  include Taggable
  include Searchable

  attr_accessible :title,
                  :body,
                  :published_at,
                  :tag_list,
                  :tag_ids,
                  :summary,
                  :blog_category_id

  belongs_to :blog_category
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

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