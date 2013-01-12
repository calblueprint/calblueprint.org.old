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
    @president = User.find_by_position('President')
    
  end

  def support
  end

  def projects
  end

end
