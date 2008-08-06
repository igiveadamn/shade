class ChangeNappies < ActiveRecord::Migration
  def self.up
    
    #t.boolean  "non_food_nappies"    
    add_column :assessments, :new_non_food_nappies, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.non_food_nappies)
        assessment.update_attribute(:new_non_food_nappies, 'sufficient')
      else
        assessment.update_attribute(:new_non_food_nappies, 'none')
      end
    end
    remove_column :assessments, :non_food_nappies
    rename_column :assessments, :new_non_food_nappies, :non_food_nappies
    
  end

  def self.down
    #t.boolean  "non_food_nappies"
    add_column :assessments, :new_non_food_nappies, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.non_food_nappies == 'sufficient')
        assessment.update_attribute(:new_non_food_nappies, true)
      else
        assessment.update_attribute(:new_non_food_nappies, false)
      end
    end
    remove_column :assessments, :non_food_nappies
    rename_column :assessments, :new_non_food_nappies, :non_food_nappies
  end
end
