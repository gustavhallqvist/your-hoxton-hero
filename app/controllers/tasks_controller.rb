require 'date'

class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [ :index ]

  def dashboard
    @tasks = policy_scope(Task).where(user: current_user).order(created_at: :asc)
    @user = current_user
    @current_time = DateTime.now
    authorize @tasks
  end

  def index
    if params[:query].present?
      @tasks = policy_scope(Task).near(params[:query], 2).order(date: :asc)
    else
      @tasks = policy_scope(Task).order(date: :asc)
    end
    @markers = @tasks.geocoded.map do |task|
      {
        lat: task.latitude,
        lng: task.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { task: task })
      }
    end
    @current_time = DateTime.now
  end

  def new
    @task = Task.new
    authorize @task
  end

  def create
    @task = Task.new(task_params)
    authorize @task
    @task.user = current_user
      if @task.save
      redirect_to task_path(@task)
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
