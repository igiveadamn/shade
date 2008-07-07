class AddWorkingAndSchoolToOccupancies < ActiveRecord::Migration
  def self.up
    
    add_column :occupancies, :working, :integer
    add_column :occupancies, :school, :integer
    
  end

  def self.down
    
    remove_column :occupancies, :working
    remove_column :occupancies, :school
    
  end
end
