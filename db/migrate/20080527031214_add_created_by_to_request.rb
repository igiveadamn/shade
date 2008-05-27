class AddCreatedByToRequest < ActiveRecord::Migration
  def self.up
    add_column :requests, :created_by, :string
  end

  def self.down
    remove_column :requests, :created_by
  end
end
