class PlanesController < ApplicationController
  def index
    @planes = Plane.all
  end

  def show
    @plane = Plane.find(params[:id])
  end

  def new
    @plane = Plane.new
  end

  def create
    @plane = Plane.new(plane_params)
    @plane.user = current_user
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def plane_params
    params.require(:plane).permit(:name, :seats, :speed, :location, :category, :photo)
  end
end
