class AddDateFieldAndIsPublishedFieldToIssues < ActiveRecord::Migration
  def self.up
    add_column    :issues, :is_published,       :boolean, :default => 0
    add_column    :issues, :publication_date,   :date
    remove_column :issues, :year
  end

  def self.down
    remove_column :issues, :is_published
    remove_column :issues, :publication_date
    add_column    :issues, :year, :integer
  end
end
