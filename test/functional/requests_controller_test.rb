require File.dirname(__FILE__) + '/../test_helper'

class RequestsControllerTest < ActionController::TestCase

  fixtures :locations, :interventions
  
  def setup
    super
    login_as :quentin
    
    @my_request = Request.create(:location => locations(:rosebank), :intervention => interventions(:food), :comments => "Comments")
  end
  
  
  
  def test_should_get_index
    get :index, :location_id => locations(:rosebank).id
    assert_response :success
    assert_not_nil assigns(:requests)
  end

  def test_should_get_new
    get :new, :location_id => locations(:rosebank).id
    assert_response :success
  end

  def test_should_create_request
    assert_difference('Request.count') do
      post :create, :request => { :comments => "Comments" }, :location_id => locations(:rosebank).id
    end

    assert_redirected_to location_path(assigns(:request).location)
  end

  def test_should_show_request
    get :show, :id => @my_request.id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => @my_request.id
    assert_response :success
  end

  def test_should_update_request
    put :update, :id => @my_request.id, :request => { }
    assert_redirected_to request_path(assigns(:request))
  end

  def test_should_destroy_request
    assert_difference('Request.count', -1) do
      delete :destroy, :id => @my_request.id
    end

    assert_redirected_to requests_path
  end
  
  def test_should_set_busy
    @my_request.status = "Open"
    post :busy, :id => @my_request.id
    @my_request.reload
    assert_equal "Busy", @my_request.status
  end

  def test_should_set_closed
    @my_request.status = "Open"
    post :closed, :id => @my_request.id
    @my_request.reload
    assert_equal "Closed", @my_request.status
  end
  
end
