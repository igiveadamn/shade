require File.dirname(__FILE__) + '/../../test_helper'

class Admin::UsersControllerTest < ActionController::TestCase
  tests Admin::UsersController

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_allow_signup
    ActionMailer::Base.deliveries = []
    assert_difference 'User.count' do
      create_user
      assert_response :redirect
    end
    assert_equal 2, ActionMailer::Base.deliveries.size
    email = ActionMailer::Base.deliveries.first
    assert_equal "[#{APP_NAME}] Please activate your new account", email.subject
  end

  def test_should_require_login_on_signup
    ActionMailer::Base.deliveries = []
    assert_no_difference 'User.count' do
      create_user(:login => nil)
      assert assigns(:user).errors.on(:login)
      assert_response :success
    end
    assert_equal 0, ActionMailer::Base.deliveries.size
  end

  def test_should_require_password_on_signup
    assert_no_difference 'User.count' do
      create_user(:password => nil)
      assert assigns(:user).errors.on(:password)
      assert_response :success
    end
  end

  def test_should_require_password_confirmation_on_signup
    assert_no_difference 'User.count' do
      create_user(:password_confirmation => nil)
      assert assigns(:user).errors.on(:password_confirmation)
      assert_response :success
    end
  end

  def test_should_require_email_on_signup
    assert_no_difference 'User.count' do
      create_user(:email => nil)
      assert assigns(:user).errors.on(:email)
      assert_response :success
    end
  end


protected
  def create_user(options = {})
    post :create, :user => { :login => 'quire', :email => 'quire@example.com',
      :password => 'quire', :password_confirmation => 'quire' }.merge(options)
  end
end
