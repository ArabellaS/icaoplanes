class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plane

  validates :start_date, presence: true
  validates :end_date, presence:true, comparison: { greater_than: :start_date }

  enum status: {
    pending: 0,
    accepted: 1,
    denied: 2
  }
end
