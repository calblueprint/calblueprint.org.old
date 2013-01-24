class UsersController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :confirm_user

  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def create
    @user = User.new(params[:user])
    @user.user = current_user

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'user was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
