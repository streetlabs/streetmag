class CreateAuthorships < ActiveRecord::Migration
  def self.up
    create_table :authorships do |t|
      t.integer :publication_id, :null => false
      t.integer :article_id, :null => false
      t.integer :author_id, :null => false
      t.boolean :is_primary, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :authorships
  end
end
