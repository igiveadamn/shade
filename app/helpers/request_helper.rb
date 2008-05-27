module RequestHelper
  
  def locations
    Location.find(:all, :order => 'name')
  end
end