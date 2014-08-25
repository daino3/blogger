class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.string :name
      t.text :body

      t.timestamps
    end
  end

  def down
  end
end
