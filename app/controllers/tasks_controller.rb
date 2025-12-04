class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @task = Task.new(
      title: params(:title),
      description: params(:description),
      completed_staus: params(:completed_staus)
    )
  end

  def edit
  end
end
