class MealsController < ApplicationController
  def index
    @user = current_user
    @today_meals = Meal.for_today
    @order = Order.new
    # @filter_meals = Meal.find
    @meal_reserved = current_user.order_made_today

    if @meal_reserved == nil
      @hash = Gmaps4rails.build_markers(@today_meals) do |meal, marker,info|
        marker.lat meal.restaurant.latitude
        marker.lng meal.restaurant.longitude
        marker.infowindow "#{meal.restaurant.name}"
        #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      end

    end


    unless @meal_reserved.nil?
      @hash = Gmaps4rails.build_markers(@meal_reserved) do |meal, marker,info|
        marker.lat meal.restaurant.latitude
        marker.lng meal.restaurant.longitude
        marker.infowindow "#{meal.restaurant.name}"
      end
        #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      @hash += Gmaps4rails.build_markers(@user) do |meal, marker,info|
        marker.lat @user.latitude
        marker.lng @user.longitude
      end
        # marker.infowindow "#{meal.restaurant.name}"
        #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })

      gmaps = GoogleMapsService::Client.new

      origins =  [@user.latitude, @user.longitude]
      destinations = [@meal_reserved.restaurant.latitude, @meal_reserved.restaurant.longitude]
      matrix = gmaps.distance_matrix(origins, destinations,
        mode: 'walking',
        language: 'fr-FR',
        units: 'km')

      @distance = matrix[:rows].first[:elements].first[:distance][:text]
      @duration = matrix[:rows].first[:elements].first[:duration][:text]
    end

  end

  def show
  end
end
