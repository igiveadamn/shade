class AddFieldsToFollowUpAssessments < ActiveRecord::Migration
  def self.up
    
    add_column :assessments, :management_government_official_assigned, :boolean
    add_column :assessments, :management_volunteer_assigned, :boolean
    add_column :assessments, :management_idp_representatives_assigned, :boolean
    add_column :assessments, :management_site_meetings_initiated, :boolean
    add_column :assessments, :management_minutes_of_last_site_meeting, :boolean
    add_column :assessments, :management_men_and_women_represented, :boolean

    add_column :assessments, :shelter_adequate, :boolean
    add_column :assessments, :shelter_number_of_tents, :integer
    add_column :assessments, :shelter_size_of_tents, :integer
    add_column :assessments, :shelter_people_per_tent, :integer
    add_column :assessments, :shelter_family_tents, :string
    add_column :assessments, :shelter_tents_leak, :string
    
    add_column :assessments, :food_regular_provider, :boolean
    add_column :assessments, :food_meals_per_day, :integer
    add_column :assessments, :food_sufficient, :boolean
    add_column :assessments, :food_provider_hdi, :integer
    add_column :assessments, :food_provider_mustadafin, :integer
    add_column :assessments, :food_provider_sanzaf, :integer
    add_column :assessments, :food_provider_salvation_army, :integer
    add_column :assessments, :food_provider_red_cross, :integer
    add_column :assessments, :food_provider_other, :integer
    add_column :assessments, :food_provider_other_detail, :string
    add_column :assessments, :food_milk_supplements_for_children, :boolean
    add_column :assessments, :food_milk_supplements_frequency, :integer
    add_column :assessments, :food_milk_supplements_method, :string
    
    add_column :assessments, :non_food_soap, :boolean
    add_column :assessments, :non_food_nappies, :boolean
    add_column :assessments, :non_food_nappies_per_child, :integer
    add_column :assessments, :non_food_sanitary_towels, :boolean
    add_column :assessments, :non_food_sanitary_towels_per_female, :integer
    add_column :assessments, :non_food_other_detail, :string
    add_column :assessments, :non_food_other, :boolean
    add_column :assessments, :non_food_other_per_person, :integer
    
    add_column :assessments, :toilets_flush, :integer
    add_column :assessments, :toilets_chemical, :integer
    add_column :assessments, :toilets_other_detail, :string
    add_column :assessments, :toilets_other, :integer
    add_column :assessments, :toilets_total, :integer
    add_column :assessments, :toilets_separate, :boolean
    add_column :assessments, :toilets_clean, :boolean
    
    add_column :assessments, :washing_showers, :integer
    add_column :assessments, :washing_baths, :integer
    add_column :assessments, :washing_basins, :integer
    add_column :assessments, :washing_separate, :boolean
    
    add_column :assessments, :lighting_sleeping, :boolean
    add_column :assessments, :lighting_communal, :boolean
    add_column :assessments, :lighting_female_toilets, :boolean
    add_column :assessments, :lighting_female_bathing, :boolean
    
    add_column :assessments, :bedding_mattresses, :integer
    add_column :assessments, :bedding_blankets, :integer
    
    add_column :assessments, :security, :string
    
    add_column :assessments, :health_distance_to_nearest, :integer
    add_column :assessments, :health_refused_care, :boolean
    add_column :assessments, :health_refused_care_clinic, :string
    add_column :assessments, :health_refused_care_date_time, :datetime
    add_column :assessments, :health_transport_to, :boolean
    add_column :assessments, :health_transport_from, :boolean
    add_column :assessments, :health_first_aid_kit, :boolean
    add_column :assessments, :health_diarrhoea, :integer
    add_column :assessments, :health_fever, :integer
    add_column :assessments, :health_rash, :integer
    add_column :assessments, :health_cough, :integer
    add_column :assessments, :health_health_worker, :boolean
    add_column :assessments, :health_health_worker_hours, :integer
    add_column :assessments, :health_health_worker_days, :integer
    
    add_column :assessments, :children_attending_school, :string
    add_column :assessments, :children_activities, :string
    add_column :assessments, :adults_reading_material, :string
    
    add_column :assessments, :legal_advice, :boolean
    add_column :assessments, :legal_information, :boolean
    add_column :assessments, :legal_assistance, :boolean

    add_column :assessments, :comments, :text

    add_column :occupancies, :babies, :integer
    
  end

  def self.down
    
    remove_column :assessments, :management_government_official_assigned
    remove_column :assessments, :management_volunteer_assigned
    remove_column :assessments, :management_idp_representatives_assigned
    remove_column :assessments, :management_site_meetings_initiated
    remove_column :assessments, :management_minutes_of_last_site_meeting
    remove_column :assessments, :management_men_and_women_represented
    
    remove_column :assessments, :shelter_adequate
    remove_column :assessments, :shelter_number_of_tents
    remove_column :assessments, :shelter_size_of_tents
    remove_column :assessments, :shelter_people_per_tent
    remove_column :assessments, :shelter_family_tents
    remove_column :assessments, :shelter_tents_leak
    
    remove_column :assessments, :food_regular_provider
    remove_column :assessments, :food_meals_per_day
    remove_column :assessments, :food_sufficient
    remove_column :assessments, :food_provider_hdi
    remove_column :assessments, :food_provider_mustadafin
    remove_column :assessments, :food_provider_sanzaf
    remove_column :assessments, :food_provider_salvation_army
    remove_column :assessments, :food_provider_red_cross
    remove_column :assessments, :food_provider_other
    remove_column :assessments, :food_provider_other_detail
    remove_column :assessments, :food_milk_supplements_for_children
    remove_column :assessments, :food_milk_supplements_frequency
    remove_column :assessments, :food_milk_supplements_method

    remove_column :assessments, :non_food_soap
    remove_column :assessments, :non_food_nappies
    remove_column :assessments, :non_food_nappies_per_child
    remove_column :assessments, :non_food_sanitary_towels
    remove_column :assessments, :non_food_sanitary_towels_per_female
    remove_column :assessments, :non_food_other_detail
    remove_column :assessments, :non_food_other
    remove_column :assessments, :non_food_other_per_person

    remove_column :assessments, :toilets_flush
    remove_column :assessments, :toilets_chemical
    remove_column :assessments, :toilets_other_detail
    remove_column :assessments, :toilets_other
    remove_column :assessments, :toilets_total
    remove_column :assessments, :toilets_separate
    remove_column :assessments, :toilets_clean

    remove_column :assessments, :washing_showers
    remove_column :assessments, :washing_baths
    remove_column :assessments, :washing_basins
    remove_column :assessments, :washing_separate

    remove_column :assessments, :lighting_sleeping
    remove_column :assessments, :lighting_communal
    remove_column :assessments, :lighting_female_toilets
    remove_column :assessments, :lighting_female_bathing
    
    remove_column :assessments, :bedding_mattresses
    remove_column :assessments, :bedding_blankets

    remove_column :assessments, :security

    remove_column :assessments, :health_distance_to_nearest
    remove_column :assessments, :health_refused_care
    remove_column :assessments, :health_refused_care_clinic
    remove_column :assessments, :health_refused_care_date_time
    remove_column :assessments, :health_transport_to
    remove_column :assessments, :health_transport_from
    remove_column :assessments, :health_first_aid_kit
    remove_column :assessments, :health_diarrhoea
    remove_column :assessments, :health_fever
    remove_column :assessments, :health_rash
    remove_column :assessments, :health_cough
    remove_column :assessments, :health_health_worker
    remove_column :assessments, :health_health_worker_hours
    remove_column :assessments, :health_health_worker_days

    remove_column :assessments, :children_attending_school
    remove_column :assessments, :children_activities
    remove_column :assessments, :adults_reading_material

    remove_column :assessments, :legal_advice
    remove_column :assessments, :legal_information
    remove_column :assessments, :legal_assistance

    remove_column :assessments, :comments

    remove_column :occupancies, :babies

  end
end
