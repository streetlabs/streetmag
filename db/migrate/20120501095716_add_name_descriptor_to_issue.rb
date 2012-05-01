class AddNameDescriptorToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :descriptor, :string, :unique => true
  end
end
