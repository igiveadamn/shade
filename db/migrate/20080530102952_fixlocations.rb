class Fixlocations < ActiveRecord::Migration
    def self.up
      remove_column :locations, :location_type
      add_column :locations, :location_type_id, :integer
    end

    def self.down
      remove_column :locations, :location_type_id
      add_column :locations, :location_type, :integer
    end
end
