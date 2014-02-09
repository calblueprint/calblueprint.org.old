class Admin::SemestersController < ApplicationController
  def create
    semester = Semester.new(safe_params)
    if semester.save
      User.copy_existing_roles(semester)
      flash[:notice] = "Semester created"
      redirect_to admin_settings_path
    end
  end

  def destroy
    semester = Semester.find(params[:id])
    Role.remove_semester_roles(semester)
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

  private
    def safe_params
      params.require(:semester).permit(:current, :semester, :year)
    end

end
