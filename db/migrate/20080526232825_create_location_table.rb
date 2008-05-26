class CreateLocationTable < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.column :name, :string
    end
  end

  def self.down
    drop_table :locations
  end
end
