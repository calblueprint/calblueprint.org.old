class Admin::PagesController < ApplicationController

  before_filter :admin_user!

  def settings
    @semester = Semester.new
  end

  def dashboard
  end

end
