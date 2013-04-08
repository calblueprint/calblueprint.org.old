class Admin::SponsorsController < ApplicationController

  before_filter :authenticate_user!
  before_filter :confirm_user
  before_filter :set_sponsorship_types
  
  def set_sponsorship_types
    @sponsorship_types = ['Gold Sponsor', 'Silver Sponsor', 'Partner']
  end

  def index
    @sponsors = Sponsor.order('sponsorship_type')
  end

  def new
    puts "\n\n\n\n\n\n\nNEW\n\n\n\n"
    @sponsor = Sponsor.new
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    puts "\n\n\n\n\n\n\nCREATE\n\n\n\n"
    @sponsor = Sponsor.new(params[:sponsor])
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
end