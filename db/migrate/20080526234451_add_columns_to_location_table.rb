class AddColumnsToLocationTable < ActiveRecord::Migration
  def self.up
    add_column :locations, :address, :string
    add_column :locations, :comments, :string
    add_column :locations, :capacity, :integer
    add_column :locations, :last_updated_user_id, :integer
  end

  def self.down
    remove_column :locations, :address
    remove_column :locations, :comments
    remove_column :locations, :capacity
    remove_column :locations, :last_updated_user_id
  end
end
