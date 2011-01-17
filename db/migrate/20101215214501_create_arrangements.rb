class CreateArrangements < ActiveRecord::Migration
  def self.up
    create_table :arrangements do |t|
      t.integer :issue_id, :null => false
      t.integer :section_id, :null => false
      t.integer :article_id, :null => false, :unique => true;
      t.integer :publication_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :arrangements
  end
end
