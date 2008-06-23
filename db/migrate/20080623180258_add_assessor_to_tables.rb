class AddAssessorToTables < ActiveRecord::Migration
  def self.up
    add_column :occupancies, :assessor_name, :string
    add_column :dailies, :assessor_name, :string
    add_column :assessments, :assessor_name, :string
  end

  def self.down
    remove_column :occupancies, :assessor_name
    remove_column :dailies, :assessor_name
    remove_column :assessments, :assessor_name
  end
end
