ActionController::Routing::Routes.draw do |map|

  map.resources :assessments

  map.resources :dailies

  map.resources :depots

  map.resources :requests, :member => {
    :busy => :post,
    :closed => :post
  }

  map.resources :supplies, :member => {
    :closed => :post
  }

  map.resources :occupancies

  map.resources :locations, :collection => {
    :occupancies_for => :get,
    :health_for => :get,
    :latest_assessments_for => :get,
    :latest_dailies_for => :get,
    :all_occupancies_for => :get,
    :all_assessments_for => :get,
    :all_dailies_for => :get,
    :activation => :get
  }, :member => {
    :activate => :post
  }
  
  map.resources :my_tasks

  map.home "/", :controller => "locations", :action => "index"

  map.connect "", :controller => "locations", :action => "index"  
  
  map.resources :users, :collection => { 
    :activate => :get,
    :forgot => :get,
    :do_forgot => :post,
    :reset => :get,
    :do_reset => :post
  }
  
  map.resource :session, :controller => :sessions
  
  map.namespace(:admin) do |admin|
    admin.home "/", :controller => "users", :action => "index"
    admin.resources :users
    admin.resources :interventions
    admin.resources :location_types
    admin.resources :regions
    admin.resources :food_providers
  end
    
  map.activate '/activate/:id', :controller => "users", :action => "activate"
  
  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
