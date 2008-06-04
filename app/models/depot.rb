class Depot < ActiveRecord::Base
  has_many :locations
  has_many :supplies, :order => 'updated_at DESC', :conditions => ["status <> 'Closed'"]

  belongs_to :region
  
  validates_presence_of :name, :address, :description
  
end
