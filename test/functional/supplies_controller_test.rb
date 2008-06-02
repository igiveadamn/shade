require File.dirname(__FILE__) + '/../test_helper'

class SuppliesControllerTest < ActionController::TestCase

  fixtures :depots, :interventions

  def setup
    super
    login_as :quentin
    
    @my_supply = Supply.create(:status => "Open", :depot => depots(:shade), :intervention => interventions(:food), :comments => "Comments", :created_by => users(:quentin))
  end

  def test_should_get_index
    get :index, :depot_id => depots(:shade).id
    assert_response :success
    assert_not_nil assigns(:supplies)
  end

  def test_should_get_new
    get :new, :depot_id => depots(:shade).id
    assert_response :success
  end

  def test_should_create_supply
    assert_difference('Supply.count') do
      post :create, :supply => { :comments => "Comments" }, :depot_id => depots(:shade).id
    end

    assert_redirected_to depot_path(assigns(:supply).depot)
  end

  def test_should_show_supply
    get :show, :id => @my_supply.id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => @my_supply.id
    assert_response :success
  end

  def test_should_update_supply
    put :update, :id => @my_supply.id, :supply => { }
    assert_redirected_to supply_path(assigns(:supply))
  end

  def test_should_destroy_supply
    assert_difference('Supply.count', -1) do
      delete :destroy, :id => @my_supply.id
    end

    assert_redirected_to supplies_path
  end

  def test_should_set_closed
    @my_supply.status = "Open"
    post :closed, :id => @my_supply.id
    @my_supply.reload
    assert_equal "Closed", @my_supply.status
  end
end
