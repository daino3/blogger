class AddNumberOfViewsToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :number_of_views, :integer, default: 0
  end

  def down
    remove_column :blog_posts, :number_of_views
  end
end
