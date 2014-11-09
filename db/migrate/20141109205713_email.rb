class Email < ActiveRecord::Migration
  def up
    create_table :emails do |t|
      t.string :to
      t.string :from
      t.string :subject
      t.text :body

      t.timestamps
    end
  end

  def down
    drop_table :emails
  end
end
