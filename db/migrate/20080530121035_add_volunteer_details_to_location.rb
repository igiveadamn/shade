class AddVolunteerDetailsToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :driving_directions, :text
    add_column :locations, :volunteer_contact, :string
    add_column :locations, :volunteer_cell, :string
    add_column :locations, :volunteer_summary, :text
    add_column :locations, :provisions_contact, :string
    add_column :locations, :provisions_cell, :string
    add_column :locations, :provisions_summary, :text
  end

  def self.down
    remove_column :locations, :provisions_summary
    remove_column :locations, :provisions_cell
    remove_column :locations, :provisions_contact
    remove_column :locations, :volunteer_summary
    remove_column :locations, :volunteer_cell
    remove_column :locations, :volunteer_contact
    remove_column :locations, :driving_directions
  end
end
