class CreateTaskReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :task_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :task, null: false, foreign_key: true
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
