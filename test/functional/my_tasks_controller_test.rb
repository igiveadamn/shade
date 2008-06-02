require File.dirname(__FILE__) + '/../test_helper'

class MyTasksControllerTest < ActionController::TestCase
  fixtures :users, :requests

  def setup
    super
    login_as :quentin
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:requests)
    assert_equal 2, assigns(:requests).length
  end
  
end
