class Supply < ActiveRecord::Base
  
  belongs_to :depot
  belongs_to :intervention
  
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by"
  
  STATUSES = %w(Open Closed)
  
  
  def last_changed_user_details
    if updated_by
      updated_by.login + " (" + updated_by.cell + ")"
    else
      created_by.login + " (" + created_by.cell + ")"
    end
  end
end
