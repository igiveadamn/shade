class ChangeSanitaryTowels < ActiveRecord::Migration
  def self.up
    
    #t.boolean  "non_food_sanitary_towels"
    add_column :assessments, :new_non_food_sanitary_towels, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.non_food_sanitary_towels)
        assessment.update_attribute(:new_non_food_sanitary_towels, 'sufficient')
      else
        assessment.update_attribute(:new_non_food_sanitary_towels, 'none')
      end
    end
    remove_column :assessments, :non_food_sanitary_towels
    rename_column :assessments, :new_non_food_sanitary_towels, :non_food_sanitary_towels
    
  end

  def self.down
    # t.boolean  "non_food_sanitary_towels"
    add_column :assessments, :new_non_food_sanitary_towels, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.non_food_sanitary_towels == 'sufficient')
        assessment.update_attribute(:new_non_food_sanitary_towels, true)
      else
        assessment.update_attribute(:new_non_food_sanitary_towels, false)
      end
    end
    remove_column :assessments, :non_food_sanitary_towels
    rename_column :assessments, :new_non_food_sanitary_towels, :non_food_sanitary_towels
  end
end
