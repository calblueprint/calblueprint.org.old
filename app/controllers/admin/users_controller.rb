class Admin::UsersController < ApplicationController

  before_filter :activated_user!
  before_filter :admin_user!, :except => [:edit, :update]
  before_filter :admin_or_owner_only!, :only => [:edit, :update]
  before_filter :set_positions

  def admin_or_owner_only!
    @user = User.find(params[:id])
    redirect_to root_path, error: "You can't do that!" unless current_user.is_admin or current_user == @user
  end

  def index
    @users = User.find(:all, :order => "name ASC")
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(safe_params)
    # generate a random password
    poss_characters =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
    random_password  =  (0...8).map{ poss_characters[rand(poss_characters.length)] }.join
    @user.password = random_password
    @user.password_confirmation = random_password
    # activate user and make visible on creation
    @user.is_activated = true
    @user.is_visible = true
    if @user.save
      UserMailer.account_created_email(@user, random_password).deliver
      redirect_to admin_users_path, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @user = User.find(params[:id])
    # if password is empty (user didn't want to change), don't update it
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    # can only change these fields if you are an admin
    unless current_user.is_admin
      params[:user].delete(:is_admin)
    end
    if @user.update_attributes(safe_params)
      redirect_to edit_admin_user_path, notice: 'User was successfully updated.' 
    else
      flash[:error] = "User couldn't be updated"
      render action: "edit"
    end
  end

  # toggle user activation
  def activate
    @user = User.find(params[:id])
    @user.is_activated = (not @user.is_activated)
    if @user.save
      flash[:notice] = "#{@user.name} successfully #{@user.is_activated ? 'activated' : 'deactivated'}!"
    else
      flash[:error] = "Couldn't #{@user.is_activated ? 'activate' : 'deactivate'} #{@user.name} :("
    end
    redirect_to admin_users_path
  end

  # toggle user visibility
  def reveal
    @user = User.find(params[:id])
    @user.is_visible = (not @user.is_visible)
    if @user.save
      flash[:notice] = "#{@user.name} successfully made #{@user.is_visible ? 'visible' : 'invisible'}!"
    else
      flash[:error] = "Couldn't #{@user.is_visible ? 'reveal' : 'hide'} #{@user.name} :("
    end
    redirect_to admin_users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end

  private
    def safe_params
      params.require(:user).permit(:email, :password, :password_confirmation, :remember_me,
                                   :is_activated, :is_admin, :is_visible, :name, :position,
                                   :year, :major, :site, :company, :is_alumni, :facebook_id,
                                   :image)
    end


end
