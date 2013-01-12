class PagesController < ApplicationController
  
  def index
  end

  def home
  end

  def join
  end

  def about
  end

  def team
    # set all the team members in order
    # this can be changed if we do randomized ordering
    # Executives will return in alphabetical order, so president is first
    #executives = User.find_all_by_position_type('Executive').order('position DESC')
    #chairs = User.find_all_by_position_type('Chair')
    #project_leaders = User.find_all_by_position_type('Project Leader')
    #members = User.find_all_by_position_type('Member')
    #@team = executives + chairs + project_leaders + members
  end

  def support
  end

  def projects
  end

end