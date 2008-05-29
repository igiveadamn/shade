require File.dirname(__FILE__) + '/../test_helper'

class LocationTest < Test::Unit::TestCase
  
  def test_should_create_location
    assert_difference 'Location.count' do
      location = create_location
      assert !location.new_record?, "#{location.errors.full_messages.to_sentence}"
    end
  end
  
  
  protected
    def create_location(options = {})
      Location.create({ :name => 'location_1', :address => 'address 1', :contact => 'andy', :cell => '075006768', :capacity => 100, :location_type => 'depot' }.merge(options))
    end
  
end