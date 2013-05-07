class PartnersController < ApplicationController

  before_filter :authenticate_user!
  before_filter :confirm_user

  def index
    @partners = Partner.all
  end

  def new
    @partner = Partner.new
  end

  def edit
    @partner = Partner.find(params[:id])
  end

  def create
    @partner = Partner.new(params[:partner])
    if @partner.save
      redirect_to edit_partners_path, notice: 'New partner was created!'
    else
      render action: "new"
    end
  end

  def update
    @partner = Partner.find(params[:id])
    if @partner.update_attributes(params[:partner])
      redirect_to edit_partners_path, notice: "Partner was updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.image = nil
    @partner.destroy

    redirect_to edit_partners_path
  end
end