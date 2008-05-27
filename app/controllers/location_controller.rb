class LocationController < ApplicationController
  before_filter :login_required

  def index
    @location = Location.find(params[:id])
  end
  
  def list
    @locations = Location.find(:all)
  end
  
  def update_availability
    if request.get?
      @location = Location.find(params[:id])
      @availabiltiy = LocationAvailability.new(:location_id => @location.id)
    elsif request.post?
      availability = LocationAvailability.create(params[:availability])
      
      redirect_to(show_location_url, :id => availability.location_id)
    end
  end
end
