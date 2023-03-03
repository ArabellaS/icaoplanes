class Plane < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings
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
  pg_search_scope :search_by_name_and_description,
    against: [ :name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
