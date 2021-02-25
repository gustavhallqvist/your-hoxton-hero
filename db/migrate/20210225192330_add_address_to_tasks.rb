class AddAddressToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :address, :string
  end
end
