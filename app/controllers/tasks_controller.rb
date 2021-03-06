class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    if params[:query].present?
      @tasks = policy_scope(Task).near(params[:query], 2).order(date: :desc)
    else
      @tasks = policy_scope(Task).order(date: :desc)
    end
    @markers = @tasks.geocoded.map do |task|
      {
        lat: task.latitude,
        lng: task.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { task: task })
      }
    end
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    @task.user = current_user
    raise
    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

private

  def set_task
    @task = Task.find(params[:id])
    authorize @task
  end

  def task_params
    params.require(:task).permit(:category_id, :date, :description, :address)
  end
end
