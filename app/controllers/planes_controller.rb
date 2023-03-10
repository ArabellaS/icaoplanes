class PlanesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_plane, except: [:index, :new, :create]
  def index
    if params[:query].present?
      @planes = policy_scope(Plane).search_by_name_and_description(params[:query])
    else
      @planes = policy_scope(Plane)
    end

    if params[:location].present?
      @planes = @planes.near(params[:location], 200)
    end
    # Creer un nouvel input dans le formulaire ded recherche
    # nommer cet input de facon sémantique, "location"
    # ensuite, on récupère dans le controller (ici) le params[:location]
    # si ce paraml est present, dans ce cas, utiliser la methode .near sur @planes
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
    @markers = [
      {
        lat: @plane.latitude,
        lng: @plane.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {plane: @plane}),
        marker_html: render_to_string(partial: "marker")
      }
    ]
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
    if @plane.update(plane_params)
      redirect_to plane_path(@plane)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @plane
    if @plane.destroy
      redirect_to profile_path, success: "your plane was destroyed!"
    else
      redirect_to profile_path, warning: "your plane was not destroyed!"
    end
  end

  private

  def set_plane
    @plane = Plane.find(params[:id])
  end

  def plane_params
    params.require(:plane).permit(:name, :seats, :speed, :address, :category, :description, :price, :photo)
  end
end
