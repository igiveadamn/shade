# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class Admin::ApplicationController < ApplicationController
  ADMIN_USER_NAME, ADMIN_PASSWORD = "admin", "adm1n" 
  before_filter :basic_authenticate if RAILS_ENV == "production"

  layout "layouts/application"
  
private

  def basic_authenticate
    authenticate_or_request_with_http_basic do |user_name, password| 
      user_name == ADMIN_USER_NAME && password == ADMIN_PASSWORD
    end            
  end

end
