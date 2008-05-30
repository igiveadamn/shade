class AddLocationTypeToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :location_type, :string
  end

  def self.down
  end
end
