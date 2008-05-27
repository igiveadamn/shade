class RequestController < ApplicationController
  before_filter :login_required

  def new
    if request.post?
      request = Request.new(params[:request].merge(:created_by => current_user.login, :status => 'new'))
      request.save
      redirect_to(show_location_url(:id => params[:location_id]))
    end
  end
end