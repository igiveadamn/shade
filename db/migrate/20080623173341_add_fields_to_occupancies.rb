class AddFieldsToOccupancies < ActiveRecord::Migration
  def self.up
    add_column :occupancies, :source_head_count, :boolean
    add_column :occupancies, :source_somebody_told_me, :boolean
    add_column :occupancies, :source_day_time, :boolean
  end

  def self.down
    remove_column :occupancies, :source_head_count
    remove_column :occupancies, :source_somebody_told_me
    remove_column :occupancies, :source_day_time
  end
end
