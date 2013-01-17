class PagesController < ApplicationController


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
    members += User.find_all_by_title("executive")
    members += User.find_all_by_title("chair")
    members += User.find_all_by_title("project_leader")
    members += User.find_all_by_title("faculty_sponsor")
    # add a nil to indicate the placement for join link
    members << nil
    # format into rows for the view
    @team = []
    while not members.empty?
      @team << members.first(5)
      members = members.drop(5)
    end
  end

  def team
    members = []
    # find all members
    members += User.find_all_by_title("executive")
    members += User.find_all_by_title("chair")
    members += User.find_all_by_title("project_leader")
    members += User.find_all_by_title("faculty_sponsor")
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