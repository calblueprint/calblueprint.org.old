class HackathonSubmissionsController < ApplicationController

  def new
    @hack = HackathonSubmission.new
    @hack.hack_photos.build
  end

  def create
    @hackathon = Hackathon.most_recent
    @hack = @hackathon.hackathon_submissions.create(hackathon_submission_params)
    @hack.url = urlify(@hack.title)
    if @hack.save
      flash[:success] = "Thanks for submitting your hack! Good luck on your presentation!"
      redirect_to hack_path(@hack)
    else
      @hack.hack_photos.build
      render 'new'
    end
  end

  def show
    @hack = HackathonSubmission.find_by(url: params[:url])
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
    params.require(:hackathon_submission).permit(:title, :description, :tag_list, :demo, :github, :video_link, students_attributes: [:id, :name, :email, :_destroy], hack_photos_attributes: [:id, :image])
  end

end
