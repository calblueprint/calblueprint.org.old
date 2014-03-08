class HackathonSubmissionsController < ApplicationController

  def new
    @hack = HackathonSubmission.new
  end

  def create
    @hackathon = Hackathon.most_recent
    @hack = @hackathon.hackathon_submissions.create(hackathon_submission_params)
    if @hack.save
      redirect_to hack_path(@hack)
    else
      render 'new'
    end
  end

  def show
    @hack = HackathonSubmission.find(params[:id])
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

  private

  def hackathon_submission_params
    params.require(:hackathon_submission).permit(:title, :description, :tag_list, :demo, :github, :video_link)
  end

end
