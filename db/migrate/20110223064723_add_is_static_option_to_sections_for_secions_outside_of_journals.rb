class AddIsStaticOptionToSectionsForSecionsOutsideOfJournals < ActiveRecord::Migration
    def self.up
      add_column    :sections, :is_static,       :boolean, :default => 0
    end

    def self.down
      remove_column :sections, :is_static
    end
  end