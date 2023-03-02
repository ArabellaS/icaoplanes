class BookingsController < ApplicationController

  before_action :set_booking, except: [:new, :create]
  before_action :set_plane, only: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.plane = @plane
    @booking.user = current_user
    if @booking.save
      redirect_to profile_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def validate
    authorize @booking
    @booking.update(status: :accepted)
    redirect_to profile_path
  end

  def deny
    authorize @booking
    @booking.update(status: :denied)
    redirect_to profile_path
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

  def set_plane
    @plane = Plane.find(params[:plane_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
