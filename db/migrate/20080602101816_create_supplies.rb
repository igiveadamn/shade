class CreateSupplies < ActiveRecord::Migration
  def self.up
    create_table :supplies do |t|
      t.integer :depot_id
      t.string :status
      t.text :comments
      t.integer :intervention_id
      t.datetime :updated_at
      t.integer :updated_by
      t.datetime :created_at
      t.integer :created_by
    end
  end

  def self.down
    drop_table :supplies
  end
end
