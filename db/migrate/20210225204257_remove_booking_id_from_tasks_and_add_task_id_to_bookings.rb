class RemoveBookingIdFromTasksAndAddTaskIdToBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :booking_id
    add_reference :bookings, :task, foreign_key: true
  end
end
