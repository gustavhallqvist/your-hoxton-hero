class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
end
