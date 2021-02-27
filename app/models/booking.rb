class Booking < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_one :booking_review
end
