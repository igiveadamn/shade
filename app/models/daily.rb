class Daily < ActiveRecord::Base
  
  belongs_to :location
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by"
  
  validates_presence_of :diarrhoea, :rashes, :pregnant_women, :coughs, :fevers
  
  
  
end
