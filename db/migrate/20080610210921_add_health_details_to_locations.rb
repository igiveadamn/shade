class AddHealthDetailsToLocations < ActiveRecord::Migration
  def self.up
    add_column :locations, :health_facility_children, :text
    add_column :locations, :health_facility_pregnant_women, :text
    add_column :locations, :health_facility_mental_health_chronic, :text    
    add_column :locations, :health_facility_mental_health_acute, :text
    add_column :locations, :health_facility_chronic_care, :text
    add_column :locations, :health_facility_tb, :text
    add_column :locations, :health_immunisations, :boolean
    add_column :locations, :health_drinking_water, :boolean
    add_column :locations, :health_number_of_showers, :integer
    add_column :locations, :health_hot_water, :boolean
    add_column :locations, :health_number_of_latrines, :integer
    add_column :locations, :health_shelter, :boolean
    add_column :locations, :health_blankets, :boolean
    add_column :locations, :health_mattresses, :boolean
  end

  def self.down
    remove_column :locations, :health_facility_children
    remove_column :locations, :health_facility_pregnant_women
    remove_column :locations, :health_facility_mental_health_chronic    
    remove_column :locations, :health_facility_mental_health_acute
    remove_column :locations, :health_facility_chronic_care
    remove_column :locations, :health_facility_tb
    remove_column :locations, :health_immunisations
    remove_column :locations, :health_drinking_water
    remove_column :locations, :health_number_of_showers
    remove_column :locations, :health_hot_water
    remove_column :locations, :health_number_of_latrines
    remove_column :locations, :health_shelter
    remove_column :locations, :health_blankets
    remove_column :locations, :health_mattresses
  end
end
