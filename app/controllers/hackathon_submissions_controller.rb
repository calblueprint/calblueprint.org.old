class HackathonSubmissionsController < ApplicationController

  def new
    @hack = HackathonSubmission.new
  end

  def create
  end

  def index
    @hackathon = Hackathon.find_by_url(params[:hackathon_url])
    @hacks = @hackathon.hackathon_submissions
  end

  def most_recent_hacks
    @hackathon = Hackathon.most_recent
    @hacks = @hackathon.hackathon_submissions
    render 'index'
  end

end
