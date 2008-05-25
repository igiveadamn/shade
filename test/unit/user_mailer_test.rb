require File.dirname(__FILE__) + '/../test_helper'
require 'user_mailer'

class UserMailerTest < Test::Unit::TestCase
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"

  fixtures :users

  include ActionMailer::Quoting

  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []

    @expected = TMail::Mail.new
    @expected.set_content_type "text", "plain", { "charset" => CHARSET }
  end

  def test_signup_notification
    email = UserMailer.create_signup_notification(users(:quentin))

    assert_equal "text/plain", email.content_type
    assert_equal "[#{APP_NAME}] Please activate your new account", email.subject
    assert_equal users(:quentin).email, email.to[0]
    assert_match /Your account has been created/, email.body
    
    assert UserMailer.deliver(email)
    assert_equal 1, ActionMailer::Base.deliveries.size
  end

  def test_activation
    email = UserMailer.create_activation(users(:quentin))

    assert_equal "text/plain", email.content_type
    assert_equal "[#{APP_NAME}] Your account has been activated!", email.subject
    assert_equal users(:quentin).email, email.to[0]
    assert_match /your account has been activated/, email.body
    
    assert UserMailer.deliver(email)
    assert_equal 1, ActionMailer::Base.deliveries.size
  end

  def test_reset_notification
    email = UserMailer.create_reset_notification(users(:quentin))

    assert_equal "text/plain", email.content_type
    assert_equal "[#{APP_NAME}] Link to reset your password", email.subject
    assert_equal users(:quentin).email, email.to[0]
    assert_match /Request to reset password/, email.body
    
    assert UserMailer.deliver(email)
    assert_equal 1, ActionMailer::Base.deliveries.size
  end

end
