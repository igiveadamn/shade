class ChangeSeparateToilets < ActiveRecord::Migration
  def self.up
    
    # t.boolean  "toilets_separate"
    add_column :assessments, :new_toilets_separate, :string
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.toilets_separate)
        assessment.update_attribute(:new_toilets_separate, 'true')
      else
        assessment.update_attribute(:new_toilets_separate, 'false')
      end
    end
    remove_column :assessments, :toilets_separate
    rename_column :assessments, :new_toilets_separate, :toilets_separate
    
  end

  def self.down
    # t.boolean  "toilets_separate"
    add_column :assessments, :new_toilets_separate, :boolean
    Assessment.reset_column_information
    Assessment.find(:all).each do |assessment|
      if (assessment.toilets_separate == 'true')
        assessment.update_attribute(:new_toilets_separate, true)
      else
        assessment.update_attribute(:new_toilets_separate, false)
      end
    end
    remove_column :assessments, :toilets_separate
    rename_column :assessments, :new_toilets_separate, :toilets_separate
  end
end
