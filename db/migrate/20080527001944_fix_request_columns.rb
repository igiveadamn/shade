class FixRequestColumns < ActiveRecord::Migration
  def self.up
    rename_column :requests, :description, :category
    
    add_column    :requests, :details, :string
    add_column    :requests, :quanity, :string
    add_column    :requests, :urgency, :string
    add_column    :requests, :collection_method, :string
  end

  def self.down
    rename_column :requests, :category, :description

    remove_column :requests, :quanity
    remove_column :requests, :details
    remove_column :requests, :urgency
    remove_column :requests, :collection_method
  end
end
