class PagesController < ApplicationController

  before_filter :set_positions, :only => :team

  def index
  end

  def home
  end

  def join
    @application = Application.new
  end

  def about
  end

  def team
    members = []
    # find all members
    @positions.each do |position|
      roles = User.where(:position => position, :is_alumni => false, :is_visible => true)
      members += roles if roles
    end
    # add a nil to indicate the placement for join link
    members << nil
    @members = organize_in_rows(members, 5)
    alumni = User.where(:is_alumni => true, :is_visible => true)
    @alumni = organize_in_rows(alumni, 5)
  end

  def sponsors
    @gold_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Gold Sponsor"), 4, fill_out: true)
    @silver_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Silver Sponsor"), 6, fill_out: true)
    @partners = organize_in_rows(Sponsor.where(:sponsorship_type => "Partner"), 6, fill_out: true)
  end

  def projects
    @projects = Project.all
  end

  def contact
    @message = Message.new
  end

end
