class HackathonsController < ApplicationController

  def most_recent
    @hackathon = Hackathon.most_recent
    render 'show'
  end

  def show
    @hackathon = Hackathon.find_by_url(params[:url])
  end

  def index
    @hackathons = Hackathon.all
  end

end
