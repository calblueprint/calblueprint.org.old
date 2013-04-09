class Admin::MembersController < ApplicationController
  
  before_filter :authenticate_user!, :set_positions
  before_filter :confirm_user

  def index
    @members = Member.order('name ASC')
  end

  def show
    @member = Member.find(params[:id])
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to admin_member_path(@member), notice: "Member was successfully created."
    else
      render action: "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      redirect_to admin_member_path(@member), notice: 'Member was successfully updated.' 
    else
      render action: "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to admin_members_path
  end
end