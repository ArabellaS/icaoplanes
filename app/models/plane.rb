class Plane < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  enum category: {
    small: 1,
    business: 2,
    commercial: 3
  }
end
