class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.string :name, :null => false
      t.integer :publication_id, :null => false
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
