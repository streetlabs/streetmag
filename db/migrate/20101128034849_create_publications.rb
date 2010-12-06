class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :title, :null => false
      t.string :subtitle
      t.string :name, :null => false
      t.text :welcome
      t.string :copyright
      t.string :issn
      t.string :publisher

      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
