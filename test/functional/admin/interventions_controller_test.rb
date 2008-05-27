require File.dirname(__FILE__) + '/../../test_helper'

class Admin::InterventionsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:interventions)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_intervention
    assert_difference('Intervention.count') do
      post :create, :intervention => { }
    end

    assert_redirected_to admin_interventions_path
  end

  def test_should_show_intervention
    get :show, :id => interventions(:food).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => interventions(:food).id
    assert_response :success
  end

  def test_should_update_intervention
    put :update, :id => interventions(:food).id, :intervention => { }
    assert_redirected_to admin_interventions_path
  end

  def test_should_destroy_intervention
    assert_difference('Intervention.count', -1) do
      delete :destroy, :id => interventions(:food).id
    end

    assert_redirected_to admin_interventions_path
  end
end
