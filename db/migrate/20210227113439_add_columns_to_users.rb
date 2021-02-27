class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :date_of_birth, :date
    add_column :users, :bio, :text
    add_column :users, :disability, :string
  end
end
