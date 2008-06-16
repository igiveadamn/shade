class AddDepotToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :depot_id, :integer
  end

  def self.down
    remove_column :users, :depot_id
  end
end
