class ChangeLightingFemaleToilets < ActiveRecord::Migration
  def self.up
    
    # t.boolean  "lighting_female_toilets"
    add_column :assessments, :new_lighting_female_toilets, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.lighting_female_toilets)
        assessment.update_attribute(:new_lighting_female_toilets, 'true')
      else
        assessment.update_attribute(:new_lighting_female_toilets, 'false')
      end
    end
    remove_column :assessments, :lighting_female_toilets
    rename_column :assessments, :new_lighting_female_toilets, :lighting_female_toilets
    
  end

  def self.down
    # t.boolean  "lighting_female_toilets"
    add_column :assessments, :new_lighting_female_toilets, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.lighting_female_toilets == 'true')
        assessment.update_attribute(:new_lighting_female_toilets, true)
      else
        assessment.update_attribute(:new_lighting_female_toilets, false)
      end
    end
    remove_column :assessments, :lighting_female_toilets
    rename_column :assessments, :new_lighting_female_toilets, :lighting_female_toilets
  end
end
