class AddFieldsToAssessments < ActiveRecord::Migration
  def self.up
    add_column :assessments, :source_head_count, :boolean
    add_column :assessments, :source_somebody_told_me, :boolean
    add_column :assessments, :source_day_time, :boolean
  end

  def self.down
    remove_column :assessments, :source_head_count
    remove_column :assessments, :source_somebody_told_me
    remove_column :assessments, :source_day_time
  end
end
