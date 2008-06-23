class CreateAssessments < ActiveRecord::Migration
  def self.up
    create_table :assessments do |t|
      t.integer :location_id
      t.datetime :assessment_date

      t.integer :profile_total
      t.integer :profile_men
      t.integer :profile_women

      t.integer :departures_total
      t.integer :departures_original_community
      t.integer :departures_another_community
      t.integer :departures_another_idp_site
      t.integer :departures_repatriation
      t.integer :departures_other
      t.text :departures_other_detail
      t.integer :departures_unknown
      
      t.integer :arrivals_total
      t.integer :arrivals_original_community
      t.integer :arrivals_another_community
      t.integer :arrivals_another_idp_site
      t.integer :arrivals_other
      t.text :arrivals_other_detail
      t.integer :arrivals_unknown

      t.datetime :updated_at
      t.integer :updated_by
      t.datetime :created_at
      t.integer :created_by
    end
  end

  def self.down
    drop_table :assessments
  end
end
