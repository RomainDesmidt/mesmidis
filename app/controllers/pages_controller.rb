class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :guideline]
  def home
    @restaurants = Restaurant.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@restaurants) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.picture({
    url: "http://res.cloudinary.com/mesmidis/image/upload/v1490694579/static-mesmidis/marker-restaurant.png",
    width: 48,
    height: 48,
})
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def guideline
    @today_meals = Meal.for_today
  end
end
