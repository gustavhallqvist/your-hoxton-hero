require 'date'

class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = policy_scope(Booking).where(user: current_user).order(created_at: :asc)
    @tasks = policy_scope(Task).where(user: current_user).order(created_at: :asc)
    @user = current_user
    @current_time = DateTime.now
  end

  def new
    @booking = Booking.new
    authorize @booking
    @task = Task.find(params[:task_id])
    @user = @task.user
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.task = Task.find(params[:task_id])
    authorize @booking
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:status)
  end
end
