class RequestController < ApplicationController
  before_filter :login_required

  def new
    if request.post?
      Request.create!(params[:request].merge(:status => 'new'))
    end
  end
end