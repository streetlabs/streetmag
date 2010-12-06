class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :title, :null => false
      t.integer :volume
      t.integer :issue_number
      t.integer :year
      t.integer :publication_id

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
