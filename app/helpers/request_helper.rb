module RequestHelper
  
  def locations
    location_id ? [Location.find_by_id(location_id)] : Location.find(:all, :order => 'name') 
  end
  
  protected
  
  def location_id
    params[:location_id]
  end
end