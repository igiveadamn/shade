class CreateFoodProviders < ActiveRecord::Migration
  def self.up
    create_table :food_providers do |t|
      t.string :name
      t.string :detail

      t.timestamps
    end
  end

  def self.down
    drop_table :food_providers
  end
end
