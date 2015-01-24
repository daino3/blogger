class AddAuthorToBlogPost < ActiveRecord::Migration
  def change
    add_column :blog_posts, :admin_user_id, :integer
  end
end
