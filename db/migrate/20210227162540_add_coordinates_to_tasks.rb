class AddCoordinatesToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :latitude, :float
    add_column :tasks, :longtitude, :float
  end
end
