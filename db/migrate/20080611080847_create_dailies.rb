class CreateDailies < ActiveRecord::Migration
  def self.up
    create_table :dailies do |t|
      t.integer :location_id
      t.integer :diarrhoea
      t.integer :rashes
      t.integer :pregnant_women
      t.integer :coughs
      t.integer :fevers
      t.boolean :appointments
      t.boolean :formula_milk
      t.text :comments

      t.datetime :updated_at
      t.integer :updated_by
      t.datetime :created_at
      t.integer :created_by
    end
  end

  def self.down
    drop_table :dailies
  end
end
