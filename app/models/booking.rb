class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plane
  has_many :reviews

  validates :start_date, presence: true
  validates :end_date, presence:true, comparison: { greater_than: :start_date }

  enum status: {
    pending: 0,
    accepted: 1,
    denied: 2
  }

  def ended?
    DateTime.now > end_date
  end
end
