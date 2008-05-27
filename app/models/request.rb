class Request < ActiveRecord::Base
  belongs_to :location
  belongs_to :intervention
  
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by"
  
  validates_presence_of :comments

  COLLECTION_METHODS = %w(Collect Deliver)
  STATUSES = %w(Open Busy Closed)
end
