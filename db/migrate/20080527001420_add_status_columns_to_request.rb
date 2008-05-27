class AddStatusColumnsToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :status, :string
    add_column :requests, :status_description, :string    
  end

  def self.down
    remove_column :requests, :status
    remove_column :requests, :status_description
  end
end
