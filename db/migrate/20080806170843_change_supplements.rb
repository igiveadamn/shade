class ChangeSupplements < ActiveRecord::Migration
  def self.up
    
    #t.boolean  "food_milk_supplements_for_children"
    add_column :assessments, :new_food_milk_supplements_for_children, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.food_milk_supplements_for_children)
        assessment.update_attribute(:new_food_milk_supplements_for_children, 'sufficient')
      else
        assessment.update_attribute(:new_food_milk_supplements_for_children, 'none')
      end
    end
    remove_column :assessments, :food_milk_supplements_for_children
    rename_column :assessments, :new_food_milk_supplements_for_children, :food_milk_supplements_for_children
    
  end

  def self.down
    # t.boolean  "food_milk_supplements_for_children"
    add_column :assessments, :new_food_milk_supplements_for_children, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.food_milk_supplements_for_children == 'sufficient')
        assessment.update_attribute(:new_food_milk_supplements_for_children, true)
      else
        assessment.update_attribute(:new_food_milk_supplements_for_children, false)
      end
    end
    remove_column :assessments, :food_milk_supplements_for_children
    rename_column :assessments, :new_food_milk_supplements_for_children, :food_milk_supplements_for_children
  end
end
