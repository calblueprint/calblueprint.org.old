class Admin::PagesController < ApplicationController

  def settings
    @semester = Semester.new
  end

end
