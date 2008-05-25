class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.find(:all, :order => "login")
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save!
    @user.activate
    redirect_to admin_users_path
    flash[:notice] = "User added!"
  rescue ActiveRecord::RecordInvalid
    render :action => 'new'
  end

end
