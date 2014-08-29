class CreatePhotos < ActiveRecord::Migration
  def up
    create_table :photos do |t|
      t.string :title
      t.string :url
      t.integer :gallery_id

      t.timestamps
    end

    create_table :galleries do |t|
      t.string :title

      t.timestamps
    end
  end

  def down
    drop_table :photos, :galleries
  end
end
