require File.dirname(__FILE__) + '/../../test_helper'

class Admin::RegionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:regions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_region
    assert_difference('Region.count') do
      post :create, :region => { :name => "cape town" }
    end

    assert_redirected_to admin_regions_path
  end

  def test_should_show_region
    get :show, :id => regions(:capetown).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => regions(:capetown).id
    assert_response :success
  end

  def test_should_update_region
    put :update, :id => regions(:capetown).id, :region => { }
    assert_redirected_to admin_regions_path
  end

  def test_should_destroy_region
    assert_difference('Region.count', -1) do
      delete :destroy, :id => regions(:capetown).id
    end

    assert_redirected_to admin_regions_path
  end
end
