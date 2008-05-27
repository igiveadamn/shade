require File.dirname(__FILE__) + '/../../test_helper'

class RequestHelperTest < Test::Unit::TestCase
  
  class StubClass
    include RequestHelper
    def params
      {:location_id => Location.find(:first, :conditions => "name = 'zzzz'")}
    end
  end
  
  def test_locations_are_sorted_by_name
    klass = Class.new { include RequestHelper }
    Location.create!(:name => 'aaaa') # created after fixtures
    assert_equal "aaaa", StubClass.new.locations.first.name
  end
  
  def test_locations_includes_location_by_id
    Location.create!(:name => 'zzzz') # created after fixtures
    assert_equal "zzzz", StubClass.new.locations.first.name
  end
end