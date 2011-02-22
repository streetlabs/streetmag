class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :summary
      t.text :content
      t.string :author
      t.integer :publication_id

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
