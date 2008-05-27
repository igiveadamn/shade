class RequestController < ApplicationController
  before_filter :login_required

  def new
    if request.post?
      request = Request.new(params[:request].merge(:status => 'new'))
      request.save
    end
  end
end