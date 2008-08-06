class ChangeOther < ActiveRecord::Migration
  def self.up
    
    #t.boolean  "non_food_other"
    add_column :assessments, :new_non_food_other, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.non_food_other)
        assessment.update_attribute(:new_non_food_other, 'sufficient')
      else
        assessment.update_attribute(:new_non_food_other, 'none')
      end
    end
    remove_column :assessments, :non_food_other
    rename_column :assessments, :new_non_food_other, :non_food_other
    
  end

  def self.down
    # t.boolean  "non_food_other"
    add_column :assessments, :new_non_food_other, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.non_food_other == 'sufficient')
        assessment.update_attribute(:new_non_food_other, true)
      else
        assessment.update_attribute(:new_non_food_other, false)
      end
    end
    remove_column :assessments, :non_food_other
    rename_column :assessments, :new_non_food_other, :non_food_other
  end
end
