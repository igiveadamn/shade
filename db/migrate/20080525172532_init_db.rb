class InitDb < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code, :string, :limit => 40
      t.column :reset_code, :string, :limit => 40
      t.column :activated_at, :datetime

      t.timestamps
    end

    create_table :organisations do |t|
      t.string :name
      t.string :address
      t.string :contact
      t.string :cell
      t.string :tel
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :users
    drop_table :organisations
  end
end
