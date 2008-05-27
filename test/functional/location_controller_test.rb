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
  
end
