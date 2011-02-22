class MoveArticlesToUsingLongTextColumnsForContent < ActiveRecord::Migration
  def self.up
    change_column :articles, :content, :longtext
  end

  def self.down
    change_column :articles, :content, :text
  end
end
