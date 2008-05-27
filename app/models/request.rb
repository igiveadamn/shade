class Request < ActiveRecord::Base
  belongs_to :location
  
  validates_presence_of :location
  validates_presence_of :description
end