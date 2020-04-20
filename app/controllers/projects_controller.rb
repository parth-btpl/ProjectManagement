class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show edit update destroy]
  respond_to :html, :json

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def show
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = t('project.create_message')
      redirect_to projects_path
    else
      render :new
    end
  end

  def update
    if @project.update(project_params)
      flash[:success] = t('project.update_message')
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy
    @projects.destroy
    flash[:notice] = t('project.destroy_message')
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.find_by(id: params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status, :start_date, :end_date, :internal_demo_date)
  end
end
