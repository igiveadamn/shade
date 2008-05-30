require File.dirname(__FILE__) + '/../test_helper'

class DepotsControllerTest < ActionController::TestCase
  
  fixtures :depots, :requests, :interventions, :locations, :location_types
  
  def setup
    super
    login_as :quentin
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:depots)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_depot
    assert_difference('Depot.count') do
      post :create, :depot => { :name => "Name", :address => "address", :description => "description" }
    end

    assert_redirected_to depot_path(assigns(:depot))
  end

  def test_should_show_depot
    get :show, :id => depots(:depot1).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => depots(:depot1).id
    assert_response :success
  end

  def test_should_update_depot
    put :update, :id => depots(:depot1).id, :depot => {  :name => "Name", :address => "address", :description => "description" }
    assert_redirected_to depot_path(assigns(:depot))
  end

  def test_should_destroy_depot
    assert_difference('Depot.count', -1) do
      delete :destroy, :id => depots(:depot1).id
    end

    assert_redirected_to depots_path
  end
end
