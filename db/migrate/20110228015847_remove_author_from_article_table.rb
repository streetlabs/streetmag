class RemoveAuthorFromArticleTable < ActiveRecord::Migration
  def self.up
    remove_column :articles, :author_id
  end

  def self.down
    add_column    :articles, :author_id, :integer
  end
end
