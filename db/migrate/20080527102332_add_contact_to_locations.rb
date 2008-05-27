class AddContactToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :contact, :string
    add_column :locations, :cell, :string
    add_column :locations, :alt_contact, :string
    add_column :locations, :alt_cell, :string
  end

  def self.down
  end
end
