class AddProvisionsSummaryToDepots < ActiveRecord::Migration
  def self.up
    remove_column :locations, :provisions_contact
    remove_column :locations, :provisions_cell
    remove_column :locations, :provisions_summary
    
    add_column :depots, :goods_summary, :text
    add_column :depots, :driving_directions, :text

    rename_column :depots, :main_contact_person, :main_contact
    rename_column :depots, :main_phone_number, :main_cell
    rename_column :depots, :goods_contact_person, :goods_contact
    rename_column :depots, :goods_phone_number, :goods_cell
    rename_column :depots, :volunteers_contact_person, :volunteer_contact
    rename_column :depots, :volunteers_phone_number, :volunteer_cell
  end

  def self.down
    add_column :locations, :provisions_contact, :string
    add_column :locations, :provisions_cell, :string
    add_column :locations, :provisions_summary, :text

    remove_column :depots, :goods_summary
    remove_column :depots, :driving_directions

    rename_column :depots, :main_contact, :main_contact_person
    rename_column :depots, :main_cell, :main_phone_number
    rename_column :depots, :goods_contact, :goods_contact_person
    rename_column :depots, :goods_cell, :goods_phone_number
    rename_column :depots, :volunteer_contact, :volunteers_contact_person
    rename_column :depots, :volunteer_cell, :volunteers_phone_number
  end
end
