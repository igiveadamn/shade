class LocationController < ApplicationController
  before_filter :login_required

  def index
    @location = Location.find(params[:id])
  end
end
