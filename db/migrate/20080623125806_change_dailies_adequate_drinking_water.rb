class ChangeDailiesAdequateDrinkingWater < ActiveRecord::Migration
  def self.up
    change_column :dailies, :water_adequate_drinking_water, :boolean
  end

  def self.down
    change_column :dailies, :water_adequate_drinking_water, :integer
  end
end
