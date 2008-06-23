class AddFieldsToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :assessor_name, :string
    
    change_column :locations, :bedding_mattresses, :integer
    change_column :locations, :bedding_blankets, :integer
  end

  def self.down
    remove_column :locations, :assessor_name
    
    change_column :locations, :bedding_mattresses, :string
    change_column :locations, :bedding_blankets, :string
  end
end
