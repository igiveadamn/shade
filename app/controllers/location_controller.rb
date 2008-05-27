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
      redirect_to(show_location_url(:id => params[:availability][:location_id])) and return if cancel?
      availability = LocationAvailability.create(params[:availability].merge(:updated_by_user_id => current_user.id))
      
      redirect_to(show_location_url, :id => availability.location_id)
    end
  end

  def add
    if request.get?
      @location = Location.new
    elsif request.post?
      redirect_to(list_locations_url) and return if cancel?

      location = Location.create(params[:location].merge(:last_updated_user_id => current_user.id))

      redirect_to(show_location_url(:id => location.id))
    end
  end
  
  protected

  def cancel?
    params[:commit] == "Cancel"
  end
  
end
