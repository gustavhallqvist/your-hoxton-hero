class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_one :task_review
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
