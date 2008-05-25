class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += "Please activate your new account"
  
    @body[:url]  = "http://#{APP_DOMAIN}/users/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += "Your account has been activated!"
    @body[:url]  = "http://#{APP_DOMAIN}/"
  end
  
  def reset_notification(user)
    setup_email(user)
    @subject    += "Link to reset your password"
    @body[:url]  = "http://#{APP_DOMAIN}/users/reset/#{user.reset_code}"
  end

protected

    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "#{ADMIN_EMAIL}@#{APP_DOMAIN}"
      @subject     = "[#{APP_NAME}] "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
