class CreateBookingReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :booking_reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
