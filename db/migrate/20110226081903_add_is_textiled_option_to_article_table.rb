class AddIsTextiledOptionToArticleTable < ActiveRecord::Migration
  def self.up
    add_column    :articles, :is_textiled,       :boolean, :default => 0
  end

  def self.down
    remove_column :articles, :is_textiled
  end
end
