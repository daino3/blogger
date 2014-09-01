class AddBlogPostIdToComments < ActiveRecord::Migration
  def change
    add_column :comments,:blog_post_id, :integer
    add_index :comments,     :blog_post_id
  end
end
