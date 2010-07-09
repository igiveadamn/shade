# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  before_filter :set_current_user_for_user_object
  before_filter :load_number_of_open_tasks

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'c88231d9e74cb35d3d327ef683602d93'

private

  def set_current_user_for_user_object
    User.current_user = current_user
  end
  
  def load_number_of_open_tasks
    @open_tasks_for_user = current_user.open_tasks.length unless current_user == :false
  end
  
end
