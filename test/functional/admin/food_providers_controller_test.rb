require File.dirname(__FILE__) + '/../../test_helper'

class Admin::FoodProvidersControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:food_providers)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_food_provider
    assert_difference('FoodProvider.count') do
      post :create, :food_provider => { }
    end

    assert_redirected_to admin_food_providers_path
  end

  def test_should_show_food_provider
    get :show, :id => food_providers(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => food_providers(:one).id
    assert_response :success
  end

  def test_should_update_food_provider
    put :update, :id => food_providers(:one).id, :food_provider => { }
    assert_redirected_to admin_food_providers_path
  end

  def test_should_destroy_food_provider
    assert_difference('FoodProvider.count', -1) do
      delete :destroy, :id => food_providers(:one).id
    end

    assert_redirected_to admin_food_providers_path
  end
end
