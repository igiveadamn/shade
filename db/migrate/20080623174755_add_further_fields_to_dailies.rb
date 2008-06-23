class AddFurtherFieldsToDailies < ActiveRecord::Migration
  def self.up
    add_column :dailies, :washing_baths_broken, :integer
  end

  def self.down
    remove_column :dailies, :washing_baths_broken
  end
end
