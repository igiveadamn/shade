class ChangeDailyBooleansToStrings < ActiveRecord::Migration
  def self.up

     # t.boolean  "food_as_scheduled"
     add_column :dailies, :new_food_as_scheduled, :string
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.food_as_scheduled)
         daily.update_attribute(:new_food_as_scheduled, 'true')
       else
         daily.update_attribute(:new_food_as_scheduled, 'false')
       end
     end
     remove_column :dailies, :food_as_scheduled
     rename_column :dailies, :new_food_as_scheduled, :food_as_scheduled


      # t.boolean  "food_sufficient"
      add_column :dailies, :new_food_sufficient, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.food_sufficient)
          daily.update_attribute(:new_food_sufficient, 'true')
        else
          daily.update_attribute(:new_food_sufficient, 'false')
        end
      end
      remove_column :dailies, :food_sufficient
      rename_column :dailies, :new_food_sufficient, :food_sufficient


      # t.boolean  "food_milk_supplements_under_6_months"
      add_column :dailies, :new_food_milk_supplements_under_6_months, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.food_milk_supplements_under_6_months)
          daily.update_attribute(:new_food_milk_supplements_under_6_months, 'true')
        else
          daily.update_attribute(:new_food_milk_supplements_under_6_months, 'false')
        end
      end
      remove_column :dailies, :food_milk_supplements_under_6_months
      rename_column :dailies, :new_food_milk_supplements_under_6_months, :food_milk_supplements_under_6_months


      # t.boolean  "food_milk_supplements_under_5_years"
      add_column :dailies, :new_food_milk_supplements_under_5_years, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.food_milk_supplements_under_5_years)
          daily.update_attribute(:new_food_milk_supplements_under_5_years, 'true')
        else
          daily.update_attribute(:new_food_milk_supplements_under_5_years, 'false')
        end
      end
      remove_column :dailies, :food_milk_supplements_under_5_years
      rename_column :dailies, :new_food_milk_supplements_under_5_years, :food_milk_supplements_under_5_years


      # t.boolean  "food_additional_for_children"
      add_column :dailies, :new_food_additional_for_children, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.food_additional_for_children)
          daily.update_attribute(:new_food_additional_for_children, 'true')
        else
          daily.update_attribute(:new_food_additional_for_children, 'false')
        end
      end
      remove_column :dailies, :food_additional_for_children
      rename_column :dailies, :new_food_additional_for_children, :food_additional_for_children


      # t.boolean  "water_adequate_drinking_water"
      add_column :dailies, :new_water_adequate_drinking_water, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.water_adequate_drinking_water)
          daily.update_attribute(:new_water_adequate_drinking_water, 'true')
        else
          daily.update_attribute(:new_water_adequate_drinking_water, 'false')
        end
      end
      remove_column :dailies, :water_adequate_drinking_water
      rename_column :dailies, :new_water_adequate_drinking_water, :water_adequate_drinking_water


      # t.boolean  "sanitation_toilets_cleaned"
      add_column :dailies, :new_sanitation_toilets_cleaned, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.sanitation_toilets_cleaned)
          daily.update_attribute(:new_sanitation_toilets_cleaned, 'true')
        else
          daily.update_attribute(:new_sanitation_toilets_cleaned, 'false')
        end
      end
      remove_column :dailies, :sanitation_toilets_cleaned
      rename_column :dailies, :new_sanitation_toilets_cleaned, :sanitation_toilets_cleaned


      # t.boolean  "sanitation_undrained_water"
      add_column :dailies, :new_sanitation_undrained_water, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.sanitation_undrained_water)
          daily.update_attribute(:new_sanitation_undrained_water, 'true')
        else
          daily.update_attribute(:new_sanitation_undrained_water, 'false')
        end
      end
      remove_column :dailies, :sanitation_undrained_water
      rename_column :dailies, :new_sanitation_undrained_water, :sanitation_undrained_water


      # t.boolean  "washing_hot_water"
      add_column :dailies, :new_washing_hot_water, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.washing_hot_water)
          daily.update_attribute(:new_washing_hot_water, 'true')
        else
          daily.update_attribute(:new_washing_hot_water, 'false')
        end
      end
      remove_column :dailies, :washing_hot_water
      rename_column :dailies, :new_washing_hot_water, :washing_hot_water


      # t.boolean  "refuse_collected"
      add_column :dailies, :new_refuse_collected, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.refuse_collected)
          daily.update_attribute(:new_refuse_collected, 'true')
        else
          daily.update_attribute(:new_refuse_collected, 'false')
        end
      end
      remove_column :dailies, :refuse_collected
      rename_column :dailies, :new_refuse_collected, :refuse_collected


      # t.boolean  "refuse_storage_adequate"
      add_column :dailies, :new_refuse_storage_adequate, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.refuse_storage_adequate)
          daily.update_attribute(:new_refuse_storage_adequate, 'true')
        else
          daily.update_attribute(:new_refuse_storage_adequate, 'false')
        end
      end
      remove_column :dailies, :refuse_storage_adequate
      rename_column :dailies, :new_refuse_storage_adequate, :refuse_storage_adequate


      # t.boolean  "electricity_broken_lights"
      add_column :dailies, :new_electricity_broken_lights, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.electricity_broken_lights)
          daily.update_attribute(:new_electricity_broken_lights, 'true')
        else
          daily.update_attribute(:new_electricity_broken_lights, 'false')
        end
      end
      remove_column :dailies, :electricity_broken_lights
      rename_column :dailies, :new_electricity_broken_lights, :electricity_broken_lights


      # t.boolean  "security_present"
      add_column :dailies, :new_security_present, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.security_present)
          daily.update_attribute(:new_security_present, 'true')
        else
          daily.update_attribute(:new_security_present, 'false')
        end
      end
      remove_column :dailies, :security_present
      rename_column :dailies, :new_security_present, :security_present


      # t.boolean  "security_adequate"
      add_column :dailies, :new_security_adequate, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.security_adequate)
          daily.update_attribute(:new_security_adequate, 'true')
        else
          daily.update_attribute(:new_security_adequate, 'false')
        end
      end
      remove_column :dailies, :security_adequate
      rename_column :dailies, :new_security_adequate, :security_adequate


      # t.boolean  "health_difficulties"
      add_column :dailies, :new_health_difficulties, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.health_difficulties)
          daily.update_attribute(:new_health_difficulties, 'true')
        else
          daily.update_attribute(:new_health_difficulties, 'false')
        end
      end
      remove_column :dailies, :health_difficulties
      rename_column :dailies, :new_health_difficulties, :health_difficulties


      # t.boolean  "education_school_difficulties"
      add_column :dailies, :new_education_school_difficulties, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.education_school_difficulties)
          daily.update_attribute(:new_education_school_difficulties, 'true')
        else
          daily.update_attribute(:new_education_school_difficulties, 'false')
        end
      end
      remove_column :dailies, :education_school_difficulties
      rename_column :dailies, :new_education_school_difficulties, :education_school_difficulties


      # t.boolean  "education_activities"
      add_column :dailies, :new_education_activities, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.education_activities)
          daily.update_attribute(:new_education_activities, 'true')
        else
          daily.update_attribute(:new_education_activities, 'false')
        end
      end
      remove_column :dailies, :education_activities
      rename_column :dailies, :new_education_activities, :education_activities


      # t.boolean  "communication_update"
      add_column :dailies, :new_communication_update, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.communication_update)
          daily.update_attribute(:new_communication_update, 'true')
        else
          daily.update_attribute(:new_communication_update, 'false')
        end
      end
      remove_column :dailies, :communication_update
      rename_column :dailies, :new_communication_update, :communication_update


      # t.boolean  "management_meetings_held"
      add_column :dailies, :new_management_meetings_held, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.management_meetings_held)
          daily.update_attribute(:new_management_meetings_held, 'true')
        else
          daily.update_attribute(:new_management_meetings_held, 'false')
        end
      end
      remove_column :dailies, :management_meetings_held
      rename_column :dailies, :new_management_meetings_held, :management_meetings_held


      # t.boolean  "legal_reintegration_assistance"
      add_column :dailies, :new_legal_reintegration_assistance, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.legal_reintegration_assistance)
          daily.update_attribute(:new_legal_reintegration_assistance, 'true')
        else
          daily.update_attribute(:new_legal_reintegration_assistance, 'false')
        end
      end
      remove_column :dailies, :legal_reintegration_assistance
      rename_column :dailies, :new_legal_reintegration_assistance, :legal_reintegration_assistance


      # t.boolean  "legal_repatriation_assistance"
      add_column :dailies, :new_legal_repatriation_assistance, :string
      Daily.reset_column_information
      Daily.find(:all).each do |daily|
        if (daily.legal_repatriation_assistance)
          daily.update_attribute(:new_legal_repatriation_assistance, 'true')
        else
          daily.update_attribute(:new_legal_repatriation_assistance, 'false')
        end
      end
      remove_column :dailies, :legal_repatriation_assistance
      rename_column :dailies, :new_legal_repatriation_assistance, :legal_repatriation_assistance

  end

  def self.down
    # t.boolean  "food_as_scheduled"
    add_column :dailies, :new_food_as_scheduled, :boolean
    Daily.reset_column_information
    Daily.find(:all).each do |daily|
      if (daily.food_as_scheduled == 'true')
        daily.update_attribute(:new_food_as_scheduled, true)
      else
        daily.update_attribute(:new_food_as_scheduled, false)
      end
    end
    remove_column :dailies, :food_as_scheduled
    rename_column :dailies, :new_food_as_scheduled, :food_as_scheduled


     # t.boolean  "food_sufficient"
     add_column :dailies, :new_food_sufficient, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.food_sufficient == 'true')
         daily.update_attribute(:new_food_sufficient, true)
       else
         daily.update_attribute(:new_food_sufficient, false)
       end
     end
     remove_column :dailies, :food_sufficient
     rename_column :dailies, :new_food_sufficient, :food_sufficient


     # t.boolean  "food_milk_supplements_under_6_months"
     add_column :dailies, :new_food_milk_supplements_under_6_months, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.food_milk_supplements_under_6_months == 'true')
         daily.update_attribute(:new_food_milk_supplements_under_6_months, true)
       else
         daily.update_attribute(:new_food_milk_supplements_under_6_months, false)
       end
     end
     remove_column :dailies, :food_milk_supplements_under_6_months
     rename_column :dailies, :new_food_milk_supplements_under_6_months, :food_milk_supplements_under_6_months


     # t.boolean  "food_milk_supplements_under_5_years"
     add_column :dailies, :new_food_milk_supplements_under_5_years, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.food_milk_supplements_under_5_years == 'true')
         daily.update_attribute(:new_food_milk_supplements_under_5_years, true)
       else
         daily.update_attribute(:new_food_milk_supplements_under_5_years, false)
       end
     end
     remove_column :dailies, :food_milk_supplements_under_5_years
     rename_column :dailies, :new_food_milk_supplements_under_5_years, :food_milk_supplements_under_5_years


     # t.boolean  "food_additional_for_children"
     add_column :dailies, :new_food_additional_for_children, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.food_additional_for_children == 'true')
         daily.update_attribute(:new_food_additional_for_children, true)
       else
         daily.update_attribute(:new_food_additional_for_children, false)
       end
     end
     remove_column :dailies, :food_additional_for_children
     rename_column :dailies, :new_food_additional_for_children, :food_additional_for_children


     # t.boolean  "water_adequate_drinking_water"
     add_column :dailies, :new_water_adequate_drinking_water, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.water_adequate_drinking_water == 'true')
         daily.update_attribute(:new_water_adequate_drinking_water, true)
       else
         daily.update_attribute(:new_water_adequate_drinking_water, false)
       end
     end
     remove_column :dailies, :water_adequate_drinking_water
     rename_column :dailies, :new_water_adequate_drinking_water, :water_adequate_drinking_water


     # t.boolean  "sanitation_toilets_cleaned"
     add_column :dailies, :new_sanitation_toilets_cleaned, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.sanitation_toilets_cleaned == 'true')
         daily.update_attribute(:new_sanitation_toilets_cleaned, true)
       else
         daily.update_attribute(:new_sanitation_toilets_cleaned, false)
       end
     end
     remove_column :dailies, :sanitation_toilets_cleaned
     rename_column :dailies, :new_sanitation_toilets_cleaned, :sanitation_toilets_cleaned


     # t.boolean  "sanitation_undrained_water"
     add_column :dailies, :new_sanitation_undrained_water, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.sanitation_undrained_water == 'true')
         daily.update_attribute(:new_sanitation_undrained_water, true)
       else
         daily.update_attribute(:new_sanitation_undrained_water, false)
       end
     end
     remove_column :dailies, :sanitation_undrained_water
     rename_column :dailies, :new_sanitation_undrained_water, :sanitation_undrained_water


     # t.boolean  "washing_hot_water"
     add_column :dailies, :new_washing_hot_water, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.washing_hot_water == 'true')
         daily.update_attribute(:new_washing_hot_water, true)
       else
         daily.update_attribute(:new_washing_hot_water, false)
       end
     end
     remove_column :dailies, :washing_hot_water
     rename_column :dailies, :new_washing_hot_water, :washing_hot_water


     # t.boolean  "refuse_collected"
     add_column :dailies, :new_refuse_collected, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.refuse_collected == 'true')
         daily.update_attribute(:new_refuse_collected, true)
       else
         daily.update_attribute(:new_refuse_collected, false)
       end
     end
     remove_column :dailies, :refuse_collected
     rename_column :dailies, :new_refuse_collected, :refuse_collected


     # t.boolean  "refuse_storage_adequate"
     add_column :dailies, :new_refuse_storage_adequate, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.refuse_storage_adequate == 'true')
         daily.update_attribute(:new_refuse_storage_adequate, true)
       else
         daily.update_attribute(:new_refuse_storage_adequate, false)
       end
     end
     remove_column :dailies, :refuse_storage_adequate
     rename_column :dailies, :new_refuse_storage_adequate, :refuse_storage_adequate


     # t.boolean  "electricity_broken_lights"
     add_column :dailies, :new_electricity_broken_lights, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.electricity_broken_lights == 'true')
         daily.update_attribute(:new_electricity_broken_lights, true)
       else
         daily.update_attribute(:new_electricity_broken_lights, false)
       end
     end
     remove_column :dailies, :electricity_broken_lights
     rename_column :dailies, :new_electricity_broken_lights, :electricity_broken_lights


     # t.boolean  "security_present"
     add_column :dailies, :new_security_present, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.security_present == 'true')
         daily.update_attribute(:new_security_present, true)
       else
         daily.update_attribute(:new_security_present, false)
       end
     end
     remove_column :dailies, :security_present
     rename_column :dailies, :new_security_present, :security_present


     # t.boolean  "security_adequate"
     add_column :dailies, :new_security_adequate, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.security_adequate == 'true')
         daily.update_attribute(:new_security_adequate, true)
       else
         daily.update_attribute(:new_security_adequate, false)
       end
     end
     remove_column :dailies, :security_adequate
     rename_column :dailies, :new_security_adequate, :security_adequate


     # t.boolean  "health_difficulties"
     add_column :dailies, :new_health_difficulties, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.health_difficulties == 'true')
         daily.update_attribute(:new_health_difficulties, true)
       else
         daily.update_attribute(:new_health_difficulties, false)
       end
     end
     remove_column :dailies, :health_difficulties
     rename_column :dailies, :new_health_difficulties, :health_difficulties


     # t.boolean  "education_school_difficulties"
     add_column :dailies, :new_education_school_difficulties, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.education_school_difficulties == 'true')
         daily.update_attribute(:new_education_school_difficulties, true)
       else
         daily.update_attribute(:new_education_school_difficulties, false)
       end
     end
     remove_column :dailies, :education_school_difficulties
     rename_column :dailies, :new_education_school_difficulties, :education_school_difficulties


     # t.boolean  "education_activities"
     add_column :dailies, :new_education_activities, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.education_activities == 'true')
         daily.update_attribute(:new_education_activities, true)
       else
         daily.update_attribute(:new_education_activities, false)
       end
     end
     remove_column :dailies, :education_activities
     rename_column :dailies, :new_education_activities, :education_activities


     # t.boolean  "communication_update"
     add_column :dailies, :new_communication_update, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.communication_update == 'true')
         daily.update_attribute(:new_communication_update, true)
       else
         daily.update_attribute(:new_communication_update, false)
       end
     end
     remove_column :dailies, :communication_update
     rename_column :dailies, :new_communication_update, :communication_update


     # t.boolean  "management_meetings_held"
     add_column :dailies, :new_management_meetings_held, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.management_meetings_held == 'true')
         daily.update_attribute(:new_management_meetings_held, true)
       else
         daily.update_attribute(:new_management_meetings_held, false)
       end
     end
     remove_column :dailies, :management_meetings_held
     rename_column :dailies, :new_management_meetings_held, :management_meetings_held


     # t.boolean  "legal_reintegration_assistance"
     add_column :dailies, :new_legal_reintegration_assistance, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.legal_reintegration_assistance == 'true')
         daily.update_attribute(:new_legal_reintegration_assistance, true)
       else
         daily.update_attribute(:new_legal_reintegration_assistance, false)
       end
     end
     remove_column :dailies, :legal_reintegration_assistance
     rename_column :dailies, :new_legal_reintegration_assistance, :legal_reintegration_assistance


     # t.boolean  "legal_repatriation_assistance"
     add_column :dailies, :new_legal_repatriation_assistance, :boolean
     Daily.reset_column_information
     Daily.find(:all).each do |daily|
       if (daily.legal_repatriation_assistance == 'true')
         daily.update_attribute(:new_legal_repatriation_assistance, true)
       else
         daily.update_attribute(:new_legal_repatriation_assistance, false)
       end
     end
     remove_column :dailies, :legal_repatriation_assistance
     rename_column :dailies, :new_legal_repatriation_assistance, :legal_repatriation_assistance
  end
end
