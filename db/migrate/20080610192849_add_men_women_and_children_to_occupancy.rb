class AddMenWomenAndChildrenToOccupancy < ActiveRecord::Migration
  def self.up
    add_column :occupancies, :men, :integer
    add_column :occupancies, :women, :integer
    add_column :occupancies, :children, :integer
  end

  def self.down
    remove_column :occupancies, :men
    remove_column :occupancies, :women
    remove_column :occupancies, :children
  end
end
