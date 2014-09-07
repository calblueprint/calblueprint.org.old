class Admin::EvaluationsController < ApplicationController

  def create
    @application = Application.find(params[:application_id])
    @evaluation = Evaluation.find_by_user_id_and_application_id(current_user.id, @application.id) || Evaluation.new(evaluation_params)
    @evaluation.update(evaluation_params)
    @evaluation.application = @application
    @evaluation.user = current_user
    if @evaluation.save
      if @application.next.nil?
        redirect_to admin_applications_path
      else
        redirect_to admin_application_path(@application.next)
      end
    else
      render "admin/applications/show"
    end
  end

  def index
    name = params[:semester_name].split('_')[0].humanize
    year = params[:semester_name].split('_')[1]
    @semester = Semester.find_by_semester_and_year(name, year)
    @applications = Application.not_hidden.semester(@semester).order('created_at DESC')
    @users = User.current_leadership
  end

  private
    def evaluation_params
      params.require(:evaluation).permit(:decision, :comment, :application_id)
    end

end
