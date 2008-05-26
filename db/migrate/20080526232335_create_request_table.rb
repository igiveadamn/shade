class CreateRequestTable < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.column :description, :string
      t.column :location_id, :integer
    end
  end

  def self.down
    drop_table :requests
  end
end
