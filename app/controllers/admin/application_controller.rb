# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Admin::ApplicationController < ApplicationController
  include AuthenticatedSystem
  
  before_filter :set_current_user_for_user_object
  before_filter :check_user_is_admin
  
  layout "layouts/application"
  
  def set_current_user_for_user_object
    User.current_user = current_user
  end
  
  def check_user_is_admin
    if !current_user || !current_user.admin?
      redirect_to locations_path
    end
  end
  
end
