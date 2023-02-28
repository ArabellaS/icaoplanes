class PlanesController < ApplicationController

  before_action :set_plane, except: [:index, :new, :create]
  def index
    @planes = policy_scope(Plane)
  end

  def show
    authorize @plane
  end

  def new
    @plane = Plane.new
    authorize @plane
  end

  def create
    @plane = Plane.new(plane_params)
    authorize @plane
    @plane.user = current_user
    if @plane.save
      redirect_to plane_path(@plane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @plane
  end

  def update
    authorize @plane
    @plane.update
  end

  def destroy
    authorize @plane
  end

  private

  def set_plane
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:name, :seats, :speed, :location, :category, :photo)
  end
end
