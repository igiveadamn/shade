ActionController::Routing::Routes.draw do |map|
  map.resources :organisations

  map.home "/", :controller => "home", :action => "index"

  map.connect "", :controller => "organisations", :action => "index"  
  
  map.resources :users, :collection => { 
    :activate => :get,
    :forgot => :get,
    :do_forgot => :post,
    :reset => :get,
    :do_reset => :post
  }
  
  map.resource  :session, :controller => :sessions
  
  map.namespace(:admin) do |admin|
    admin.home "/", :controller => "users", :action => "index"
    admin.resources :users
  end
    
  map.activate '/activate/:id', :controller => "users", :action => "activate"
  
  map.add_location 'location/add', :controller => "location", :action => "add"
  map.list_locations 'location/list', :controller => "location", :action => "list"
  map.update_availability 'location/update_availability/:id', :controller => "location", :action => "update_availability"
  map.show_location 'location/:id', :controller => "location", :action => "index"
  
  map.add_request_for_location 'location/:location_id/request', :controller => 'request', :action => 'new' 
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
