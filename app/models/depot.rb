class Depot < ActiveRecord::Base
  
  validates_presence_of :name, :address, :description
  
end
