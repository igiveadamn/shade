class AddUserDetails < ActiveRecord::Migration
  def self.up
    add_column :users, :name, :string
    add_column :users, :cell, :string
  end

  def self.down
  end
end
