class Assessment < ActiveRecord::Base

  belongs_to :location
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by"

  NA_TRUE_FALSE = %w(N/A true false)
  MILK_SUPPLEMENTS_METHOD = %w(Cups Bottles)
  SECURITY = %w(None LessThan24Hours 24Hours)
  
end
