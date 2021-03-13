class BookingReviewsController < ApplicationController
    before_action :set_booking_review, only: [:show, :edit, :update, :destroy]

  def index
    @booking_reviews = BookingReview.where(user: current_user).reverse
  end

  def new
    @booking_review = BookingReview.new
  end

  def create
    @booking_review = BookingReview.new(booking_review_params)
    @booking_review.user = current_user
    @booking_review.booking = Booking.find(params[:booking_id])
    if @booking_review.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @booking_review.update(booking_review_params)
    redirect_to bookings_path
  end

  def destroy
    @booking_review.destroy
    redirect_to bookings_path
  end

private

  def set_booking_review
    @booking_review = BookingReview.find(params[:id])
  end

  def booking_review_params
    params.require(:booking_review).permit(:rating, :comment)
  end
end
