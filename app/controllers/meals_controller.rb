class MealsController < ApplicationController

  def index
    @today_meals = Meal.for_today

    @meal_reserved = current_user.order_made_today

    @hash = Gmaps4rails.build_markers(@today_meals) do |meal, marker|
      marker.lat meal.restaurant.latitude
      marker.lng meal.restaurant.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end



  def show
    @meal = Meal.for_today.find(params[:id])
    @order = Order.new
    @hash = Gmaps4rails.build_markers([@meal]) do |meal, marker|
      marker.lat meal.restaurant.latitude
      marker.lng meal.restaurant.longitude
    end
  end

end
