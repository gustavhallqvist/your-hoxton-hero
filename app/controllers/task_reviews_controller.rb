class TaskReviewsController < ApplicationController
before_action :set_task_review, only: [:show, :edit, :update, :destroy]

  def index
    @task_reviews = Task_review.where(user: current_user).reverse
  end

  def new
    @task_review = Task_review.new
  end

  def create
    @task_review = Task_review.new(task_review_params)
    @task_review.user = current_user
    @task_review.booking = Booking.find(params[:booking_id])
    if @task_review.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @task_review.update(task_review_params)
    redirect_to tasks_path
  end

  def destroy
    @task_review.destroy
    redirect_to tasks_path
  end

private

  def set_task_review
    @task_review = Task_review.find(params[:id])
  end

  def task_review_params
    params.require(:task_review).permit(:rating, :comment)
  end
end
