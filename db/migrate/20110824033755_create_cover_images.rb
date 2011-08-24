class CreateCoverImages < ActiveRecord::Migration
  def change
    create_table :cover_images do |t|
      t.string :title
      t.integer :issue_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size

      t.timestamps
    end
  end
end
