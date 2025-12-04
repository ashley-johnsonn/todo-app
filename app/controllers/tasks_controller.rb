require "date"
class TasksController < ApplicationController
  # Runs before the action
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]

  # Shows all tasks
  def index
    @tasks = Task.order(completed_status: :asc, created_at: :desc)
  end

  # Shows individual task
  def show
  end

  # Displays form for new task
  def new
    @task = Task.new
  end

  # Processes the form submission
  def create
    @task = Task.new(task_params)
    if @task.save
      # redirect somewhere else on success
      redirect_to tasks_path
    else
      render :new
    end
  end

  # Displays the edit form
  def edit
    # puts "@task = #{@task.inspect}"
  end

  # Process the edit form submission
  def update
    if @task.update(task_params)
      # reditect someone on success
      redirect_to tasks_path
    else
      # render again on failure
      render :edit
    end
  end

  # Delete task
  def destroy
    @task.destroy
    redirect_to tasks_path
  end
end

private

def set_task
  @task = Task.find(params[:id])
end

def task_params
  params.require(:task).permit(:title, :description, :completed_status)
end
