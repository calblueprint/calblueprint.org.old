class Admin::ProjectsController < ApplicationController

  before_filter :activated_user!
  before_filter :admin_user!

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    3.times { @project.project_photos.build }
  end

  def edit
    @project = Project.find(params[:id])
    3.times { @project.project_photos.build }
  end

  def create
    @project = Project.new(safe_params)
    if @project.save
      redirect_to admin_projects_path, notice: 'New project was created!'
    else
      render action: "new"
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(safe_params)
      redirect_to admin_projects_path, notice: "Project was updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.image = nil
    @project.destroy

    redirect_to admin_projects_path
  end

  private

    def safe_params
      params.require(:project).permit(:client, :title, :description, :link, :image, :semester_id, :app_type, project_photos_attributes: [:image, :id])
    end

end
