ActionController::Routing::Routes.draw do |map|
  map.resources :organisations

  map.connect "", :controller => "organisations", :action => "index"
  
  map.home "/", :controller => "home", :action => "index"
  
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

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
