class Admin::SemestersController < ApplicationController
  def create
    semester = Semester.new(params[:semester])
    if semester.save
      flash[:notice] = "Semester created"
      redirect_to settings_path
    end
  end

  def destroy
    semester = Semester.find(params[:id])
    semester.destroy
    flash[:alert] = "Semester deleted"
    redirect_to settings_path
  end

  def make_current
    semester = Semester.find(params[:id])
    if old_current = Semester.current
      old_current.update_attributes(current: false)
    end
    semester.current = true
    if semester.save
      flash[:notice] = "Semester updated"
      redirect_to settings_path
    end
  end
end