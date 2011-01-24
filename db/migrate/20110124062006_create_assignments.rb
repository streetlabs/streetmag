class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments, :id => false do |t|
      t.references :role, :user, :publication
    end
  end

  def self.down
    drop_table :assignments
  end
end

