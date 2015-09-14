class AddSlugToTags < ActiveRecord::Migration
  def change
    add_column :tags , :slug, :text
    add_index :tags, :slug, unique: true
  end
end
