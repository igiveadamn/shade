class AddActiveToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :active, :boolean

    Location.find(:all).each do |location|
      location.update_attribute(:active, true)
    end

  end

  def self.down
    remove_column :locations, :active
  end
end
