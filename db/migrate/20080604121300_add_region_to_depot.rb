class AddRegionToDepot < ActiveRecord::Migration
  def self.up
    add_column :depots, :region_id, :integer
    
    Depot.find(:all).each do |depot|
  		depot.update_attribute(:region_id, Region.find(:first)) if Region.find(:first)
		end
    
  end

  def self.down
    remove_column :depots, :region_id
  end
end
