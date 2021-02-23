class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.where(user: current_user).reverse
    @bookings = Booking.where(user: current_user).reverse
    @booking_requests = current_user.tasks.map { |task| task.bookings }
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
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
  end

  def task_params
    params.require(:task).permit(:category_id, :date, :description)
  end
end
