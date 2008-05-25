require File.dirname(__FILE__) + '/../test_helper'

class HomeControllerTest < ActionController::TestCase
  tests HomeController

  def setup
    super
    login_as :quentin
  end

  def test_index
    get :index
    assert_response :success
  end
  
end
