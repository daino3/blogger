class DropGalleryTable < ActiveRecord::Migration
  def up
    drop_table :galleries
    remove_column :photos, :gallery_id
  end

  def down
    create_table :galleries
    add_column :photos, :gallery_id, :integer
  end
end
