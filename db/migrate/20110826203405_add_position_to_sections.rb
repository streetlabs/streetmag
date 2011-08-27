class AddPositionToSections < ActiveRecord::Migration
  def change
    add_column :sections, :position, :integer, :default => 0
  end
end
