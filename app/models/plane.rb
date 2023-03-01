class Plane < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo
  validates :name, presence: true
  validates :seats, presence: true
  validates :speed, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :description, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  enum category: {
    small: 1,
    business: 2,
    commercial: 3
  }
end
