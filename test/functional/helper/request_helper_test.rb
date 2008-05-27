require File.dirname(__FILE__) + '/../../test_helper'

class RequestHelperTest < Test::Unit::TestCase
  
  def test_locations_are_sorted_by_name
    klass = Class.new { include RequestHelper }
    Location.create!(:name => 'aaaa') # created after fixtures
    assert_equal "aaaa", klass.new.locations.first.name
  end
end