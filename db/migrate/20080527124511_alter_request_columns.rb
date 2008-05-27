class AlterRequestColumns < ActiveRecord::Migration
  def self.up
   remove_column :requests, :category
   remove_column :requests, :details
   remove_column :requests, :quanity
   remove_column :requests, :urgency
   remove_column :requests, :status_description
   add_column :requests, :updated_by, :integer
   add_column :requests, :comments, :text
  end

  def self.down
  end
end
