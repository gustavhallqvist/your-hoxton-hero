class Task < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_one :task_review
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_date,
                  against: [:date],
                  using: { tsearch: { prefix: true } }
  validates :date, presence: true
end
