class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

