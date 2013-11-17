class Admin::SponsorsController < ApplicationController

  before_filter :activated_user!
  before_filter :admin_user!
  before_filter :set_sponsorship_types

  def set_sponsorship_types
    @sponsorship_types = ['Gold Sponsor', 'Silver Sponsor', 'Partner']
  end

  def index
    @sponsors = Sponsor.order('sponsorship_type')
  end

  def new
    @sponsor = Sponsor.new
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    @sponsor = Sponsor.new(safe_params)
    if @sponsor.save
      redirect_to admin_sponsors_path, notice: 'New sponsor was created!'
    else
      render action: "new"
    end
  end

  def update
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.update_attributes(params[:sponsor])
      redirect_to admin_sponsors_path, notice: "Sponsor was updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    @sponsor.image = nil
    @sponsor.destroy

    redirect_to admin_sponsors_path
  end

  private
    def safe_params
      params.require(:sponsor).permit(:sponsorship_type, :sponsor_link, :image)
    end

end
