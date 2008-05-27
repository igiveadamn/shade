class AlterLocations < ActiveRecord::Migration
  def self.up
    change_column :locations, :address, :text
    change_column :locations, :comments, :text
    add_column :locations, :updated_by, :integer
    add_column :locations, :created_by, :integer
    remove_column :locations, :last_updated_user_id
  end

  def self.down
  end
end
