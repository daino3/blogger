class RenamePhotoUrl < ActiveRecord::Migration
  def up
    rename_column :photos, :url, :file_location
  end

  def down
  end
end
