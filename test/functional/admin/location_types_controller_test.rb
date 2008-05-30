require File.dirname(__FILE__) + '/../../test_helper'

class Admin::LocationTypesControllerTest < ActionController::TestCase
  
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:location_types)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_location_type
    assert_difference('LocationType.count') do
      post :create, :location_type => { }
    end

    assert_redirected_to admin_location_types_path
  end

  def test_should_show_location_type
    get :show, :id => location_types(:school).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => location_types(:school).id
    assert_response :success
  end

  def test_should_update_location_type
    put :update, :id => location_types(:school).id, :location_type => { }
    assert_redirected_to admin_location_types_path
  end

  def test_should_destroy_location_type
    assert_difference('LocationType.count', -1) do
      delete :destroy, :id => location_types(:school).id
    end

    assert_redirected_to admin_location_types_path
  end
end
