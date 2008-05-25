require File.dirname(__FILE__) + '/../test_helper'

class UsersControllerTest < ActionController::TestCase
  tests UsersController

  fixtures :users

  def test_should_activate_user
    assert_nil User.authenticate('aaron', 'test')
    get :activate, :id => users(:aaron).activation_code
    assert_redirected_to '/'
    assert_not_nil flash[:notice]
    assert_equal users(:aaron), User.authenticate('aaron', 'test')
  end
  
  def test_should_not_activate_user_without_key
    get :activate
    assert_nil flash[:notice]
  rescue ActionController::RoutingError
    # in the event your routes deny this, we'll just bow out gracefully.
  end

  def test_should_not_activate_user_with_blank_key
    get :activate, :id => ''
    assert_nil flash[:notice]
  rescue ActionController::RoutingError
    # well played, sir
  end

  def test_should_get_forgot
    get :forgot
    assert_response :success
  end
  
  def test_should_send_email_when_forgot_with_correct_email
    ActionMailer::Base.deliveries = []
    post :do_forgot, :user => { :email => users(:quentin).email }
    assert_redirected_to new_session_path
    assert_equal 1, ActionMailer::Base.deliveries.size
    email = ActionMailer::Base.deliveries.first
    assert_equal "[#{APP_NAME}] Link to reset your password", email.subject
  end
  
  def test_should_not_send_email_when_forgot_with_wrong_email
    ActionMailer::Base.deliveries = []
    post :do_forgot, :user => { :email => "unknown@spam.com" }
    assert_response :success
    assert_template "forgot"
    assert_equal 0, ActionMailer::Base.deliveries.size
  end
  
  def test_should_show_reset_password
    user = users(:quentin)
    user.create_reset_code!
    get :reset, :id => user.reset_code
    assert_response :success
  end
  
  def test_should_render_forgot_if_reset_password_with_unknown_reset_code
    get :reset, :id => "rubbish"
    assert_response :success
    assert_template "forgot"
  end

end
