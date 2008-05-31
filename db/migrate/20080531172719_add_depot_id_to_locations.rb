class AddDepotIdToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :depot_id, :integer
  end

  def self.down
    remove_column :locations, :depot_id
  end
end
