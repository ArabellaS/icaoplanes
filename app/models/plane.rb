class Plane < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  enum category: {
    small: 1,
    business: 2,
    commercial: 3
  }
end
