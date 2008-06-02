require File.dirname(__FILE__) + '/../test_helper'

class LocationTest < Test::Unit::TestCase
  fixtures :locations, :location_types, :depots
  
  def test_should_create_location
    assert_difference 'Location.count' do
      location = create_location
      assert !location.new_record?, "#{location.errors.full_messages.to_sentence}"
    end
  end

  def test_should_require_numeric_capacity
    assert_no_difference 'Location.count' do
      location = create_location(:capacity => 'asd')
      assert location.errors.on(:capacity)
    end
  end
  
  def test_should_require_numeric_integer_capacity
    assert_no_difference 'Location.count' do
      location = create_location(:capacity => 4.5)
      assert location.errors.on(:capacity)
    end
  end
  
  def test_should_require_positive_number_capacity
    assert_no_difference 'Location.count' do
      location = create_location(:capacity => -1)
      assert location.errors.on(:capacity)
    end
  end
  
  def test_should_require_mandatory_fields
    [:name, :address, :contact, :cell, :capacity].each do |field|
      assert_no_difference 'Location.count' do
        location = create_location(field => nil)
        assert location.errors.on(field)
      end
    end
  end
  
  protected
    def create_location(options = {})
      Location.create({ :name => 'location_1', :address => 'address 1', :contact => 'andy', :cell => '075006768', :capacity => 100, :location_type => location_types(:church), :depot => depots(:shade) }.merge(options))
    end
end