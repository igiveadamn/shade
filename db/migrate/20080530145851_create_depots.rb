class CreateDepots < ActiveRecord::Migration
  def self.up
    create_table :depots do |t|
      t.string :name
      t.string :description
      t.text :address
      t.string :main_contact_person
      t.string :main_phone_number
      t.string :goods_contact_person
      t.string :goods_phone_number
      t.string :volunteers_contact_person
      t.string :volunteers_phone_number

      t.timestamps
    end
  end

  def self.down
    drop_table :depots
  end
end
