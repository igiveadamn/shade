require File.dirname(__FILE__) + '/../test_helper'

class RequestTest < Test::Unit::TestCase
  
  def test_request_must_have_a_location
    request = Request.new
    request.valid?
    assert_equal "can't be blank", request.errors[:location]
  end
  
  def test_request_must_have_a_category
    request = Request.new
    request.valid?
    assert_equal "can't be blank", request.errors[:category]
  end
end