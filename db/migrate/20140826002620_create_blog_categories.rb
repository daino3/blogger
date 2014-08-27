class CreateBlogCategories < ActiveRecord::Migration
  def up
    add_column :blog_posts, :blog_category_id, :integer

    create_table :blog_categories do |t|
      t.string :name
      t.integer :number_of_posts

      t.timestamps
    end
  end

  def down
    drop_table :blog_categories
  end
end
