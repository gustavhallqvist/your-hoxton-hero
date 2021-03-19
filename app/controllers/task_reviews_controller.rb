require 'date'

class TaskReviewsController < ApplicationController
before_action :set_task_review, only: [:show, :edit, :update, :destroy]

  def index
    @task_reviews = TaskReview.where(user: current_user).reverse
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :asc)
    @tasks = policy_scope(Task).where(user: current_user).order(created_at: :asc)
    @user = current_user
    @current_time = DateTime.now
  end

  def new
    @task_review = TaskReview.new
    @task = Task.find(params[:task_id])
    authorize @task_review
  end

  def create
    @task_review = TaskReview.new(task_review_params)
    @task_review.user = current_user
    @task_review.task = Task.find(params[:task_id])
    if @task_review.save
      redirect_to bookings_path
    else
      render :new
    end
    authorize @task_review
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
    @task_review = TaskReview.find(params[:id])
  end

  def task_review_params
    params.require(:task_review).permit(:rating, :comment)
  end
end
