class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  skip_after_action :verify_authorized, only: [:home, :profile]

  def home
  end

  # à retravailler une fois qu'on aura fait les autorisations
  def profile
    @bookings = Booking.all
    @planes = Plane.all
  end
end
