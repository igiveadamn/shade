class AddInterventionToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :intervention_id, :integer
  end

  def self.down
  end
end
