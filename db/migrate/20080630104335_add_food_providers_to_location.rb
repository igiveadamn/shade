class AddFoodProvidersToLocation < ActiveRecord::Migration
  def self.up
    add_column :locations, :food_provider_hdi, :integer
    add_column :locations, :food_provider_mustadafin, :integer
    add_column :locations, :food_provider_sanzaf, :integer
    add_column :locations, :food_provider_salvation_army, :integer
    add_column :locations, :food_provider_red_cross, :integer
    add_column :locations, :food_provider_other, :integer
    add_column :locations, :food_provider_other_detail, :string
  end

  def self.down
    remove_column :locations, :food_provider_hdi
    remove_column :locations, :food_provider_mustadafin
    remove_column :locations, :food_provider_sanzaf
    remove_column :locations, :food_provider_salvation_army
    remove_column :locations, :food_provider_red_cross
    remove_column :locations, :food_provider_other
    remove_column :locations, :food_provider_other_detail
  end
end
