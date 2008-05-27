# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :set_current_user_for_user_object

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c88231d9e74cb35d3d327ef683602d93'

private

  def set_current_user_for_user_object
    User.current_user = current_user
  end
  
end
