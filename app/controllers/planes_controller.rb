class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_plane, except: [:index, :new, :create]
  def index
    @planes = policy_scope(Plane)
    @markers = @planes.geocoded.map do |plane|
      {
        lat: plane.latitude,
        lng: plane.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {plane: plane}),
        marker_html: render_to_string(partial: "marker")
      }
    end
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
    @plane.update(plane_params)
    redirect_to plane_path(@plane)
  end

  def destroy
    authorize @plane
    @plane.destroy
  end

  private

  def set_plane
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:name, :seats, :speed, :address, :category, :description, :photo)
  end
end
