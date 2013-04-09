class Admin::UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :confirm_user

  def index
    @users = User.all
  end

  def create
    @user = User.new(params[:user])
    @user.user = current_user
    if @user.save
      redirect_to admin_user_path(@user), notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def approve
    @user = User.find(params[:id])
    @user.approved = true
    if @user.save
      flash[:notice] = "User approved!"
    else
      flash[:error] = "Couldn't approve user."
    end
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
    end
  end
end
