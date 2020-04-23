# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :find_task, only: %i[show edit update destroy]

  def index
    @tasks = pagination(find_project.tasks)
  end

  def new
    @task = find_project.tasks.new
  end

  def edit; end

  def show; end

  def create
    @task = find_project.tasks.new(task_params)
    if @task.save
      redirect_to project_tasks_path(project_id: @task.project_id)
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_path(project_id: @task.project_id)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_path(project_id: @task.project_id)
  end

  private

  def find_project
    Project.find(params[:project_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :status, :delivery_date, :project_id)
  end
end
