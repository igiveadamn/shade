require File.dirname(__FILE__) + '/../test_helper'

class OccupancyTest < ActiveSupport::TestCase


  def test_creates_occupancy
    assert_difference 'Occupancy.count' do
      occupancy = create
      assert !occupancy.new_record?, "#{occupancy.errors.full_messages.to_sentence}"
    end
  end

  def test_requires_quantity
    assert_no_difference 'Occupancy.count' do
      occupancy = create(:quantity => nil)
      assert occupancy.errors.on(:quantity)
    end
  end
  
  def test_requires_men
    assert_no_difference 'Occupancy.count' do
      occupancy = create(:men => nil)
      assert occupancy.errors.on(:men)
    end
  end
  
  def test_requires_women
    assert_no_difference 'Occupancy.count' do
      occupancy = create(:women => nil)
      assert occupancy.errors.on(:women)
    end
  end
  
  def test_requires_children
    assert_no_difference 'Occupancy.count' do
      occupancy = create(:children => nil)
      assert occupancy.errors.on(:children)
    end
  end
  
  protected
    def create(options = {})
      Occupancy.create({ :quantity => 1, :comments => "Comments", :men => 12, :women => 23, :children => 34 }.merge(options))
    end
  
end
