class AddingMissingTimestampColumns < ActiveRecord::Migration
  def self.up
    add_column :requests, :created_at, :datetime
    add_column :requests, :updated_at, :datetime    
    
    add_column :locations, :created_at, :datetime
    add_column :locations, :updated_at, :datetime    
  end

  def self.down
    remove_column :requests, :created_at
    remove_column :requests, :updated_at    
    
    remove_column :locations, :created_at
    remove_column :locations, :updated_at    
  end
end
