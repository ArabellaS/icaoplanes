class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized, only: [:home, :profile]

  def home
    @planes = Plane.all
  end

  def profile
    @bookings = current_user.bookings
    @bookings_as_owner = current_user.bookings_as_owner
    @planes = current_user.planes
    @review = Review.new
    @n = 0
  end
end
