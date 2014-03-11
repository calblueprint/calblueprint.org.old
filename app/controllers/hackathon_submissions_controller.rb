class HackathonSubmissionsController < ApplicationController
  before_filter :hack, only: [:show]
  before_filter :hackathon, only: [:index]
  before_filter :most_recent_hackathon, only: [:create, :most_recent_hacks]

  def new
    @hack = HackathonSubmission.new
    @hack.hack_photos.build
  end

  def create
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
  end

  def index
    @hacks = @hackathon.hackathon_submissions
  end

  def most_recent_hacks
    @hacks = @hackathon.hackathon_submissions
    render 'index'
  end

  private

  def hackathon
    @hackathon = Hackathon.find_by(url: params[:hackathon_url])
  end

  def most_recent_hackathon
    @hackathon = Hackthon.most_recent
  end

  def hack
    @hack = HackathonSubmission.find_by(url: params[:url])
  end

  def hackathon_submission_params
    params.require(:hackathon_submission).permit(
      :title,
      :description,
      :tag_list,
      :demo,
      :github,
      :video_link,
      students_attributes: [
        :id,
        :name,
        :email,
        :_destroy,
      ],
      hack_photos_attributes: [
        :id,
        :image,
      ],
    )
  end

end
