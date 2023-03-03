class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @plane = @booking.plane
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to plane_path(@plane)
    else
      render "profile", status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end

end
