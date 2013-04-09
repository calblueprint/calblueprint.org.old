class PagesController < ApplicationController

  before_filter :set_positions, :only => :about

  def index
  end

  def home
  end

  def join
    @application = Application.new
  end

  def about
    members = []
    # find all members
    @positions.each do |position|
      roles = Member.find_all_by_position(position)
      members += roles if roles
    end
    # add a nil to indicate the placement for join link
    members << nil
    @team = organize_in_rows(members, 5)
  end

  def sponsors
    @gold_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Gold Sponsor"), 4)
    @silver_sponsors = organize_in_rows(Sponsor.where(:sponsorship_type => "Silver Sponsor"), 5)
    @partners = organize_in_rows(Sponsor.where(:sponsorship_type => "Partner"), 4)
  end

  def projects
    @projects = Project.all
  end

  def contact
    @message = Message.new
  end

end