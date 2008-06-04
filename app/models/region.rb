class Region < ActiveRecord::Base

  has_many :depots
  has_many :locations
  
  validates_presence_of :name
  
end
