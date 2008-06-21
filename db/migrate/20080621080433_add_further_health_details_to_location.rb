class AddFurtherHealthDetailsToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :site_established_date, :datetime
    add_column :locations, :management_government_official_assigned, :boolean
    add_column :locations, :management_volunteer_assigned, :boolean
    add_column :locations, :management_idp_representatives_assigned, :boolean
    add_column :locations, :management_site_meetings_initiated, :boolean
    add_column :locations, :management_minutes_of_last_site_meeting, :boolean
    add_column :locations, :management_men_and_women_represented, :boolean

    add_column :locations, :shelter_type, :string
    add_column :locations, :shelter_type_detail, :string
    add_column :locations, :shelter_families_together, :boolean
    add_column :locations, :shelter_area, :integer

    add_column :locations, :food_regular_provider, :boolean
    add_column :locations, :food_meals_per_day, :integer
    add_column :locations, :food_milk_supplements_for_children, :boolean

    add_column :locations, :nonfood_disposable_nappies, :boolean
    add_column :locations, :nonfood_sanitary_towels, :boolean

    add_column :locations, :sanitation_flush, :integer
    add_column :locations, :sanitation_chemical, :integer
    add_column :locations, :sanitation_other, :integer
    add_column :locations, :sanitation_other_detail, :string
    add_column :locations, :sanitation_total, :integer
    add_column :locations, :sanitation_separate, :boolean

    add_column :locations, :water_source, :string
    add_column :locations, :water_source_detail, :string

    add_column :locations, :washing_showers, :integer
    add_column :locations, :washing_baths, :integer
    add_column :locations, :washing_basins, :integer

    add_column :locations, :refuse_storage_type, :string
    add_column :locations, :refuse_removal_type, :string

    add_column :locations, :electric_lighting_sleeping, :boolean
    add_column :locations, :electric_lighting_communal, :boolean

    add_column :locations, :bedding_mattresses, :string
    add_column :locations, :bedding_blankets, :string

    add_column :locations, :security, :string

    add_column :locations, :health_frequency, :string
    add_column :locations, :health_nearest, :integer

    add_column :locations, :education_children_attending_school, :boolean
    add_column :locations, :education_children_recreational_activities, :boolean
    add_column :locations, :education_adults_reading_material, :boolean

    add_column :locations, :legal_support_available, :boolean
    add_column :locations, :legal_regular_information, :boolean
    add_column :locations, :legal_assistance, :boolean

    remove_column :locations, :health_drinking_water
    remove_column :locations, :health_number_of_showers
    remove_column :locations, :health_number_of_latrines
    remove_column :locations, :health_shelter
    remove_column :locations, :health_blankets
    remove_column :locations, :health_mattresses

    add_column :occupancies, :pregnant, :integer
    add_column :occupancies, :chronic_medication, :integer
    
  end

  def self.down
    add_column :locations, :health_drinking_water, :boolean
    add_column :locations, :health_number_of_showers, :integer
    add_column :locations, :health_number_of_latrines, :integer
    add_column :locations, :health_shelter, :boolean
    add_column :locations, :health_blankets, :boolean
    add_column :locations, :health_mattresses, :boolean

    remove_column :locations, :site_established_date
    remove_column :locations, :management_government_official_assigned
    remove_column :locations, :management_volunteer_assigned
    remove_column :locations, :management_idp_representatives_assigned
    remove_column :locations, :management_site_meetings_initiated
    remove_column :locations, :management_minutes_of_last_site_meeting
    remove_column :locations, :management_men_and_women_represented

    remove_column :locations, :shelter_type
    remove_column :locations, :shelter_type_other_detail
    remove_column :locations, :shelter_families_together
    remove_column :locations, :shelter_area

    remove_column :locations, :food_regular_provider
    remove_column :locations, :food_meals_per_day
    remove_column :locations, :food_milk_supplements_for_children

    remove_column :locations, :nonfood_disposable_nappies
    remove_column :locations, :nonfood_sanitary_towels

    remove_column :locations, :sanitation_flush
    remove_column :locations, :sanitation_chemical
    remove_column :locations, :sanitation_other
    remove_column :locations, :sanitation_other_detail
    remove_column :locations, :sanitation_total
    remove_column :locations, :sanitation_separate

    remove_column :locations, :water_source
    remove_column :locations, :water_source_other_detail

    remove_column :locations, :washing_showers
    remove_column :locations, :washing_baths
    remove_column :locations, :washing_basins

    remove_column :locations, :refuse_storage_type
    remove_column :locations, :refuse_removal_type

    remove_column :locations, :electric_lighting_sleeping
    remove_column :locations, :electric_lighting_communal

    remove_column :locations, :bedding_mattresses
    remove_column :locations, :bedding_blankets

    remove_column :locations, :security

    remove_column :locations, :health_frequency
    remove_column :locations, :health_nearest

    remove_column :locations, :education_children_attending_school
    remove_column :locations, :education_children_recreational_activities
    remove_column :locations, :education_adults_reading_material

    remove_column :locations, :legal_support_available
    remove_column :locations, :legal_regular_information
    remove_column :locations, :legal_assistance

    remove_column :occupancies, :pregnant
    remove_column :occupancies, :chronic_medication
  end
end
