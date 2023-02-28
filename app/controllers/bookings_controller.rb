class BookingsController < ApplicationController

  before_action :set_booking, except: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
    @plane = Plane.find(params[:plane_id])
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.plane = Plane.find(params[:plane_id])
    @booking.user = current_user
    if @booking.save
      redirect_to plane_path(@booking.plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def validate
    authorize @booking
    @booking.update(status: :accepted)
  end

  def deny
    authorize @booking
    @booking.update(status: :denied)
  end

  def update
    authorize @booking
    @booking.update
  end

  def destroy
    authorize @booking
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
