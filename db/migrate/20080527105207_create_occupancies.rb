class CreateOccupancies < ActiveRecord::Migration
  def self.up
    create_table :occupancies do |t|
      t.integer :quantity
      t.text :comments
      t.integer :location_id
      t.integer :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :occupancies
  end
end
