require File.dirname(__FILE__) + '/../test_helper'

class LocationTest < Test::Unit::TestCase
  
  def test_location_can_have_many_requests
    location = Location.new
    location.requests << Request.new(:description => 'need x')
    location.requests << Request.new(:description => 'need y')
    assert_equal 2, location.requests.size
  end
end