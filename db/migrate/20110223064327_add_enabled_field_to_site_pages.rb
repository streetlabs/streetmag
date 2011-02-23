class AddEnabledFieldToSitePages < ActiveRecord::Migration
  def self.up
    add_column    :site_pages, :is_published,       :boolean, :default => 0
    remove_column :site_pages, :author_id
  end

  def self.down
    remove_column :site_pages, :is_published
    add_column    :site_pages, :author_id,       :integer, :null => false
  end
end
