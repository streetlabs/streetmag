class CreateSitePages < ActiveRecord::Migration
  def self.up
    create_table :site_pages do |t|
      t.string :title, :null => false
      t.column :content, :longtext
      t.integer :author_id, :null => false
      t.integer :publication_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :site_pages
  end
end
