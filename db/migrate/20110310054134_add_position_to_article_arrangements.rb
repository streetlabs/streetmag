class AddPositionToArticleArrangements < ActiveRecord::Migration
  def self.up
    add_column :arrangements, :position, :integer, :default => 0
  end

  def self.down
    remove_column :arrangements, :position
  end
end
