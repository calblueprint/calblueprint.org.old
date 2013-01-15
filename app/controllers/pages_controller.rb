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
      roles = Member.find_all_by_position(position)
      members += roles if roles
    end
    # add a nil to indicate the placement for join link
    members << nil
    # format into rows for the view
    @team = []
    while not members.empty?
      @team << members.first(5)
      members = members.drop(5)
    end
  end

  def support
  end

  def projects
  end

  def contact
    @message = Message.new
  end

end