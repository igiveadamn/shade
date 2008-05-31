class Depot < ActiveRecord::Base
  has_many :locations
  
  validates_presence_of :name, :address, :description
  
end
