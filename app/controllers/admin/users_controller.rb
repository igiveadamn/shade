class Admin::UsersController < Admin::ApplicationController

  before_filter :login_required

  def index
    @users = User.find(:all, :order => "login")
  end
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
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

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to admin_users_path
    else
      render :action => "edit"
    end
  end

end
