class MealsController < ApplicationController

  def index
    @today_meals = Meal.for_today
    # pour les tests à supprimer
    #@yesterday_meals = Meal.for_yesterday
    #@tomorrow_meals = Meal.for_tomorrow

    @hash = Gmaps4rails.build_markers(@today_meals) do |meal, marker|
      marker.lat meal.restaurant.latitude
      marker.lng meal.restaurant.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @meal = Meal.for_today.find(params[:id])
    @hash = Gmaps4rails.build_markers([@meal]) do |meal, marker|
      marker.lat meal.restaurant.latitude
      marker.lng meal.restaurant.longitude
    end
  end
end
