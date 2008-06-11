require File.dirname(__FILE__) + '/../test_helper'

class DailiesControllerTest < ActionController::TestCase

  fixtures :locations
  
  def setup
    super
    login_as :quentin
  end

  def test_should_get_index
    get :index, :location_id => locations(:rosebank).id
    assert_response :success
    assert_not_nil assigns(:dailies)
  end

  def test_should_get_new
    get :new, :location_id => locations(:rosebank).id
    assert_response :success
  end

  def test_should_create_daily
    assert_difference('Daily.count') do
      post :create, :daily => { :diarrhoea => 1, :rashes => 2, :pregnant_women => 3, :coughs => 4, :fevers => 5 }, :location_id => locations(:rosebank).id
    end

    assert_redirected_to location_path(locations(:rosebank))
  end

end
