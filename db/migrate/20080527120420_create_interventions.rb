class CreateInterventions < ActiveRecord::Migration
  def self.up
    create_table :interventions do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :interventions
  end
end
