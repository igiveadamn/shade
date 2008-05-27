require 'abstract_unit'
require 'userstamp.rb'

class ActiveRecord::Base
  include Userstamp
end

class User < ActiveRecord::Base
  cattr_accessor :current_user
end

class Entry < ActiveRecord::Base
  belongs_to :created_by, :class_name => "User", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "User", :foreign_key => "updated_by"
end

class Post < ActiveRecord::Base
  record_userstamps = false
end

class Order < ActiveRecord::Base
  set_user_model_name :customer
  
  belongs_to :created_by, :class_name => "Customer", :foreign_key => "created_by"
  belongs_to :updated_by, :class_name => "Customer", :foreign_key => "updated_by"
end

class Customer < ActiveRecord::Base
  cattr_accessor :current_user
end

class UserstampTest < Test::Unit::TestCase
  fixtures :all
  
  def setup
    super
    User.current_user = @first_user
  end

  def teardown
    super
    User.current_user = nil
  end
  
  def test_should_include_module
    assert ActiveRecord::Base.include?(Userstamp)
  end
  
  def test_should_have_user_model
    assert_equal User, @first_entry.user_model
    assert_equal User, @second_entry.user_model
  end

  def test_should_have_write_methods
    assert Entry.new.respond_to?("created_by=")
    assert Entry.new.respond_to?("updated_by=")
    assert Post.new.respond_to?("created_by=")
    assert Post.new.respond_to?("updated_by=")
  end

  def test_should_have_read_methods
    assert Entry.new.respond_to?("created_by")
    assert Entry.new.respond_to?("updated_by")
    assert Post.new.respond_to?("created_by")
    assert Post.new.respond_to?("updated_by")
  end

  def test_should_set_created_by_from_fixtures
    assert_equal @first_user, @first_entry.created_by
    assert_equal @second_user, @second_entry.created_by

    assert_nil @first_post.created_by
    assert_nil @second_post.created_by
  end

  def test_should_set_updated_by_from_fixtures
    assert_equal @first_user, @first_entry.updated_by
    assert_equal @second_user, @second_entry.updated_by

    assert_nil @first_post.updated_by
    assert_nil @second_post.updated_by
  end

  def test_should_set_updated_by_for_create
    third_user = User.create("name" => "Tester Three")

    User.current_user = third_user
    assert_equal third_user, User.current_user

    third_entry = Entry.create("name" => "Third Entry")

    assert_equal User, third_entry.user_model
    assert_equal third_user, third_entry.created_by
    assert_nil third_entry.updated_by
  end

  def test_should_set_updated_by_for_update
    @second_entry.update_attribute("name", "Updated by First User")
    assert_equal @first_user, @second_entry.updated_by
    
    User.current_user = @second_user
    assert_equal @second_user, User.current_user
    @first_entry.update_attribute("name", "Updated by Second User")
    assert_equal @second_user, @first_entry.updated_by
  end

  def test_create_and_update_entry
    third_entry = Entry.create("name" => "Third Entry")
    assert_equal @first_user, third_entry.created_by
    
    User.current_user = @second_user
    assert_equal @second_user, User.current_user
    
    third_entry.update_attribute("name", "Updated by Second User")
    assert_equal @second_user, third_entry.updated_by
  end

  def test_update_with_nil_current_user
    @first_entry.update_attribute("name", "Updated by Nil")

    assert_equal @first_user, @first_entry.created_by
    assert_equal @first_user, @first_entry.updated_by
  end

  def test_create_with_different_user_model
    Customer.current_user = @first_customer
    assert_equal @first_customer, Customer.current_user
    
    order = Order.create("name" => "Customer Created Order")
    assert_equal Customer, order.user_model
    assert_equal @first_customer, order.created_by
    assert_nil order.updated_by
    
    order.update_attributes(:name => 'Order updated')
    assert_equal @first_customer, order.updated_by
  end
end
