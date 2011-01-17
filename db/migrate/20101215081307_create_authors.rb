class CreateAuthors < ActiveRecord::Migration
  def self.up
    create_table :authors do |t|
      t.string :name, :null => false
      t.integer :publication_id, :null => false
      t.string :email
      t.string :url
      t.string :affiliation
      t.text :bio

      t.timestamps
    end
  end

  def self.down
    drop_table :authors
  end
end
