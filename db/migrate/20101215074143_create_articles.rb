class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string :title, :null => false
      t.integer :author_id, :null => false
      t.text :abstract
      t.text :content, :null => false
      t.text :notes
      t.text :cited_works
      t.text :excerpt
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
