# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController
  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      session[:region] = params[:region][:id]
      flash[:notice] = "Logged in successfully"
      redirect_back_or_default(home_path)
    else
      flash[:notice] = "Couldn't log you in. Remember your login is not your email address ..."
      render :action => :new
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
end
