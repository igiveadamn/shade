require File.dirname(__FILE__) + '/../test_helper'

class OccupanciesControllerTest < ActionController::TestCase

  fixtures :locations
  
  def setup
    super
    login_as :quentin
  end
  
  def test_should_get_index
    get :index, :location_id => locations(:rosebank).id
    assert_response :success
    assert_not_nil assigns(:occupancies)
  end

  def test_should_get_new
    get :new, :location_id => locations(:rosebank).id
    assert_response :success
  end

  def test_should_create_occupancy
    assert_difference('Occupancy.count') do
      post :create, :occupancy => { :quantity => 1, :comments => "Comments", :men => 12, :women => 23, :children => 34 }, :location_id => locations(:rosebank).id
    end

    assert_redirected_to location_path(locations(:rosebank))
  end

end
