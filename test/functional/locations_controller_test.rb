require File.dirname(__FILE__) + '/../test_helper'

class LocationsControllerTest < ActionController::TestCase

  fixtures :requests, :interventions, :locations
  
  def setup
    super
    login_as :quentin
  end
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:locations)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_location
    assert_difference('Location.count') do
      post :create, :location => { :name => "Name", :address => "rovberts rtoad", :contact => "Quentin", :cell => "082445345", :capacity => 50 }
    end

    assert_redirected_to location_path(assigns(:location))
  end

  def test_should_show_location
    get :show, :id => locations(:rosebank).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => locations(:rosebank).id
    assert_response :success
  end

  def test_should_update_location
    put :update, :id => locations(:rosebank).id, :location => { :name => "Name", :address => "rovberts rtoad", :contact => "Quentin", :cell => "082445345" }
    assert_redirected_to location_path(assigns(:location))
  end

  def test_should_destroy_location
    assert_difference('Location.count', -1) do
      delete :destroy, :id => locations(:rosebank).id
    end

    assert_redirected_to locations_path
  end
end
