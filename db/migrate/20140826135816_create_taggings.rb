class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :blog_category_id

      t.timestamps
    end

    create_table :taggings do |t|
      t.belongs_to :tag
      t.belongs_to :blog_post

      t.timestamps
    end
    
    add_index :tags,     :blog_category_id
    add_index :taggings, :tag_id
    add_index :taggings, :blog_post_id
  end
end
