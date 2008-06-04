class Region < ActiveRecord::Base

  has_many :depots
  
  validates_presence_of :name
  
end
