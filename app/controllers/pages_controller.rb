class PagesController < ApplicationController
  def home
  end

  # à retravailler une fois qu'on aura fait les autorisations
  def profile
    @bookings = Booking.all
    @planes = Plane.all
  end
end
