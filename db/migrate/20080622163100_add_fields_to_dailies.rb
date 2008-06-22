class AddFieldsToDailies < ActiveRecord::Migration

  def self.up
    remove_column :dailies, :formula_milk
    
    add_column :dailies, :assessment_date, :datetime
    add_column :dailies, :food_as_scheduled, :boolean
    add_column :dailies, :food_sufficient, :boolean
    add_column :dailies, :food_milk_supplements_under_6_months, :boolean
    add_column :dailies, :food_milk_supplements_under_5_years, :boolean
    add_column :dailies, :food_additional_for_children, :boolean
    add_column :dailies, :food_comments, :text
    add_column :dailies, :bedding_without_mattresses, :integer
    add_column :dailies, :bedding_without_blankets, :integer
    add_column :dailies, :water_adequate_drinking_water, :integer
    add_column :dailies, :sanitation_toilets_broken_flush, :integer
    add_column :dailies, :sanitation_toilets_broken_chemical, :integer
    add_column :dailies, :sanitation_toilets_broken_other, :integer
    add_column :dailies, :sanitation_toilets_cleaned, :boolean
    add_column :dailies, :sanitation_undrained_water, :boolean
    add_column :dailies, :washing_hot_water, :boolean
    add_column :dailies, :washing_showers_broken, :integer
    add_column :dailies, :washing_basins_broken, :integer
    add_column :dailies, :washing_showers_without_soap, :integer
    add_column :dailies, :refuse_collected, :boolean
    add_column :dailies, :refuse_storage_adequate, :boolean
    add_column :dailies, :electricity_broken_lights, :boolean
    add_column :dailies, :security_present, :boolean
    add_column :dailies, :security_adequate, :boolean
    add_column :dailies, :security_incidents, :integer
    rename_column :dailies, :diarrhoea, :health_diarrhoea
    rename_column :dailies, :rashes, :health_rashes
    rename_column :dailies, :coughs, :health_coughs
    rename_column :dailies, :fevers, :health_fevers
    rename_column :dailies, :pregnant_women, :health_pregnant_women
    rename_column :dailies, :appointments, :health_appointments
    add_column :dailies, :health_admissions, :integer
    add_column :dailies, :health_difficulties, :boolean
    add_column :dailies, :education_school_difficulties, :boolean
    add_column :dailies, :education_activities, :boolean
    add_column :dailies, :communication_update, :boolean
    add_column :dailies, :management_meetings_held, :boolean
    add_column :dailies, :legal_reintegration_assistance, :boolean
    add_column :dailies, :legal_repatriation_assistance, :boolean
    
  end

  def self.down
    add_column :dailies, :formula_milk, :boolean
    
    remove_column :dailies, :assessment_date
    remove_column :dailies, :food_as_scheduled
    remove_column :dailies, :food_sufficient
    remove_column :dailies, :food_milk_supplements_under_6_months
    remove_column :dailies, :food_milk_supplements_under_5_years
    remove_column :dailies, :food_additional_for_children
    remove_column :dailies, :food_comments
    remove_column :dailies, :bedding_without_mattresses
    remove_column :dailies, :bedding_without_blankets
    remove_column :dailies, :water_adequate_drinking_water
    remove_column :dailies, :sanitation_toilets_broken_flush
    remove_column :dailies, :sanitation_toilets_broken_chemical
    remove_column :dailies, :sanitation_toilets_broken_other
    remove_column :dailies, :sanitation_toilets_cleaned
    remove_column :dailies, :sanitation_undrained_water
    remove_column :dailies, :washing_hot_water
    remove_column :dailies, :washing_showers_broken
    remove_column :dailies, :washing_basins_broken
    remove_column :dailies, :washing_showers_without_soap
    remove_column :dailies, :refuse_collected
    remove_column :dailies, :refuse_storage_adequate
    remove_column :dailies, :electricity_broken_lights
    remove_column :dailies, :security_present
    remove_column :dailies, :security_adequate
    remove_column :dailies, :security_incidents
    rename_column :dailies, :health_diarrhoea, :diarrhoea
    rename_column :dailies, :health_rashes, :rashes
    rename_column :dailies, :health_coughs, :coughs
    rename_column :dailies, :health_fevers, :fevers
    rename_column :dailies, :health_pregnant_women, :pregnant_women
    rename_column :dailies, :health_appointments, :appointments
    remove_column :dailies, :health_admissions
    remove_column :dailies, :health_difficulties
    remove_column :dailies, :education_school_difficulties
    remove_column :dailies, :education_activities
    remove_column :dailies, :communication_update
    remove_column :dailies, :management_meetings_held
    remove_column :dailies, :legal_reintegration_assistance
    remove_column :dailies, :legal_repatriation_assistance
    
  end
end
