class CreateLocationAvailabilityTable < ActiveRecord::Migration
  def self.up
    create_table :location_availabilities do |t|
      t.column :location_id, :integer
      t.column :availability, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :location_availabilities
  end
end
