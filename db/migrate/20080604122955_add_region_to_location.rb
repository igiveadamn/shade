class AddRegionToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :region_id, :integer
    
    Location.find(:all).each do |location|
  		location.update_attribute(:region_id, Region.find(:first)) if Region.find(:first)
		end
  end

  def self.down
    remove_column :locations, :region_id
  end
end
