class ChangeLightingFemaleBathing < ActiveRecord::Migration
  def self.up
    
    # t.boolean  "lighting_female_bathing"
    add_column :assessments, :new_lighting_female_bathing, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.lighting_female_bathing)
        assessment.update_attribute(:new_lighting_female_bathing, 'true')
      else
        assessment.update_attribute(:new_lighting_female_bathing, 'false')
      end
    end
    remove_column :assessments, :lighting_female_bathing
    rename_column :assessments, :new_lighting_female_bathing, :lighting_female_bathing
    
  end

  def self.down
    # t.boolean  "lighting_female_bathing"
    add_column :assessments, :new_lighting_female_bathing, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.lighting_female_bathing == 'true')
        assessment.update_attribute(:new_lighting_female_bathing, true)
      else
        assessment.update_attribute(:new_lighting_female_bathing, false)
      end
    end
    remove_column :assessments, :lighting_female_bathing
    rename_column :assessments, :new_lighting_female_bathing, :lighting_female_bathing
  end
end
