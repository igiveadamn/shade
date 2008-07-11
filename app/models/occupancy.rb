class Occupancy < ActiveRecord::Base
  belongs_to :location
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  
  validates_presence_of :quantity, :men, :women, :working, :school, :children, :babies, :pregnant, :chronic_medication
end
