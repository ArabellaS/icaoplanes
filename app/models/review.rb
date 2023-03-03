class Review < ApplicationRecord
  belongs_to :booking
  delegate :user, to: :booking
end
