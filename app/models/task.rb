class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :booking
end
