class AddColumnsToLocationAvailabilityTable < ActiveRecord::Migration
  def self.up
    add_column :location_availabilities, :comments, :string
    add_column :location_availabilities, :updated_by_user_id, :integer
  end

  def self.down
    remove_column :location_availabilities, :comments
    remove column :location_availabilities, :updated_by_user_id
  end
end
