class ChangeSeparateWashing < ActiveRecord::Migration
  def self.up
    
    # t.boolean  "washing_separate"
    add_column :assessments, :new_washing_separate, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.washing_separate)
        assessment.update_attribute(:new_washing_separate, 'true')
      else
        assessment.update_attribute(:new_washing_separate, 'false')
      end
    end
    remove_column :assessments, :washing_separate
    rename_column :assessments, :new_washing_separate, :washing_separate
    
  end

  def self.down
    # t.boolean  "washing_separate"
    add_column :assessments, :new_washing_separate, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.washing_separate == 'true')
        assessment.update_attribute(:new_washing_separate, true)
      else
        assessment.update_attribute(:new_washing_separate, false)
      end
    end
    remove_column :assessments, :washing_separate
    rename_column :assessments, :new_washing_separate, :washing_separate
  end
end
