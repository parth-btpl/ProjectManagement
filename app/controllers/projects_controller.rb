# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show edit update destroy]

  def index
    @q = Project.ransack(params[:q])
    @projects = pagination(@q.result)
    @project_list = Project.all
    respond_to do |format|
      format.html
      format.csv { send_data @project_list.to_csv(['name', 'description', 'status', 'start_date', 'end_date', 'internal_demo_date']) }
    end
  end

  def import
    Project.import(params[:file])
    redirect_to projects_path, notice: "Projects imported."
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :status, :start_date, :end_date, :internal_demo_date)
  end
end
