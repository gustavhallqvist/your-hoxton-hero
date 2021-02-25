class AddAdditionalColumnsToUSers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :surname, :string
    add_column :users, :address, :string
    add_column :users, :contact_number, :string
  end
end
