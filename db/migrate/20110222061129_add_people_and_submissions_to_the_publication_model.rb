class AddPeopleAndSubmissionsToThePublicationModel < ActiveRecord::Migration
  def self.up
    add_column :publications, :people, :text
    add_column :publications, :submissions, :text
  end

  def self.down
    remove_column :publications, :people
    remove_column :publications, :submissions
  end
end

