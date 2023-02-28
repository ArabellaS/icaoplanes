class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @plane = Plane.find(params[:plane_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.plane = Plane.find(params[:plane_id])
    @booking.user = current_user
    if @booking.save
      redirect_to plane_path(@plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def validate
    @booking = Booking.find(params[:id])
    @booking.update(status: "accepted")
  end

  def deny
    @booking = Booking.find(params[:id])
    @booking.update(status: "denied")
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
