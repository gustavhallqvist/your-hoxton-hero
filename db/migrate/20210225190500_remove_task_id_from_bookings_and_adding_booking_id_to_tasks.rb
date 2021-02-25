class RemoveTaskIdFromBookingsAndAddingBookingIdToTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :task_id
    add_reference :tasks, :booking, foreign_key: true
  end
end
