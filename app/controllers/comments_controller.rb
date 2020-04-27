# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: %i[show edit update destroy]

  def index
    @comments = Comment.all
  end

  def new
    @comment = find_task.comments.new
  end

  def edit
    @project = Project.find(params[:project_id])
    @task = Task.find(params[:task_id])
  end

  def show; end

  def create
    @comment = find_task.comments.new(comment_params)
    if @comment.save
      redirect_to project_tasks_path(task_id: @comment.task_id)
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params.except('project_id'))
      redirect_to project_tasks_path(task_id: @comment.task_id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to project_tasks_path
  end

  private

  def find_task
    Task.find(params[:task_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description, :task_id)
  end
end
