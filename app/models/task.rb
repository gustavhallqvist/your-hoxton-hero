class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_one :task_review
end
