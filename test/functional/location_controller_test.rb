require File.dirname(__FILE__) + '/../test_helper'

class LocationControllerTest < ActionController::TestCase
  tests LocationController

  def setup
    super
    login_as :quentin
  end

  def test_index
    get :index, :id => 1
    assert_response :success
  end
  
  def test_list
    get :list
    assert_response :success
  end

  def test_get_update_availability
    get :update_availability, :id => 1
    assert_response :success
  end
  
  def test_post_update_availability
    post :update_availability, :availability => {:location_id => 1, :availability => 40}
    assert_response :redirect
    assert_equal 40, Location.find(1).availability
  end
  
  def test_get_add
    get :add
    assert_response :success
  end
  
  def test_post_add
    post :add, :location => {:name => "some location", :capacity => 50}
    assert_response :redirect
    assert_equal 50, Location.find_by_name("some location").capacity
  end
  
end
