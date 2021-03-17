require 'date'

class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def show
    @current_date = Date.today
    @bookings = policy_scope(Booking).where(user: @user).order(created_at: :asc)
    @tasks = policy_scope(Task).where(user: @user).order(created_at: :asc)
  end

  private

  def set_user
    @user = User.find(params[:id])
    authorize @user
  end
end
