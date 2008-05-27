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
      availability = LocationAvailability.create(params[:availability].merge(:updated_by_user_id => current_user.id))
      
      redirect_to(show_location_url, :id => availability.location_id)
    end
  end

  def add
    if request.get?
      @location = Location.new
    elsif request.post?
      location = Location.create(params[:location].merge(:last_updated_user_id => current_user.id))

      redirect_to(show_location_url(:id => location.id))
    end
  end
end
