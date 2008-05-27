require File.dirname(__FILE__) + '/../test_helper'

class RequestControllerTest < ActionController::TestCase
  tests RequestController

  def setup
    super
    login_as :quentin
  end
  
  def test_post_create_a_new_request_for_a_location
    post :new, {:request => {:location_id => 1, :category => 'test'}}
    assert_equal 'new', Request.find(:first).status
  end
  
end