class UsersController < ApplicationController
  
  def activate
    self.current_user = params[:id].blank? ? :false : User.find_by_activation_code(params[:id])
    if logged_in? && !current_user.activated?
      current_user.activate
      flash[:notice] = "Signup complete!"
    end
    redirect_back_or_default('/')
  end

  def forgot
  end

  def do_forgot
    user = User.find_by_email(params[:user][:email])
    if user
      user.create_reset_code!
      flash[:notice] = "Reset code sent to #{user.email}"
      redirect_to new_session_path
    else
      flash[:notice] = "#{params[:user][:email]} does not exist in the system"
      render :action => :forgot
    end
  end
  
  def reset
    @reset_code = params[:id]
    @user = User.find_by_reset_code(@reset_code)
    if @user.nil?
      flash[:notice] = "Your reset code didn't work ... please make sure that no part of the URL is 'broken off'. This sometimes happen in emails, where part of the address wraps to the next line. Cut&amp;paste the entire URL into your browser please."
      render :action => :forgot
    end
  end
  
  def do_reset
    @reset_code = params[:reset_code]
    @user = User.find_by_reset_code(@reset_code)
    # don't do update_attributes(params[:user]) else user can change email address
    if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
      self.current_user = @user
      @user.delete_reset_code
      flash[:notice] = "Password reset successfully for #{@user.email}"
      redirect_back_or_default('/')
    else
      render :action => :reset
    end
  end
end
