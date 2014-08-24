class CreateBlogs < ActiveRecord::Migration
  def up
    create_table :blog_posts do |t|
      t.string :title
      t.text :body
      t.date :published_at

      t.timestamps
    end

    create_table :comments do |t|
      t.string :author
      t.text :body

      t.timestamps
    end
  end

  def down
    drop_table :blog_posts
    drop_table :comments
  end
end
