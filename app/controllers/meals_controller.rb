class MealsController < ApplicationController
  def index
    @user = current_user
    @user_subscription = UserSubscription.where(user_id: @user.id)

    # on verifie si l'utilisateur a une subscription sinon on le redirige vers le paiement
    if @user_subscription == []
      redirect_to new_user_subscription_path
    end

    # en provenance du search-bar : meals_path

    @today_meals = Meal.for_today
    @order = Order.new
    # @filter_meals = Meal.find
    @meal_reserved = current_user.order_made_today


    ########### AFFICHAGE DE L'ENSEMBLE DES PLATS DU JOUR #############
    if @meal_reserved == nil
      #  marker restaurant
      @hash = Gmaps4rails.build_markers(@today_meals) do |meal, marker,info|
        marker.lat meal.restaurant.latitude
        marker.lng meal.restaurant.longitude
        marker.infowindow "#{meal.restaurant.name}"
        marker.picture({
                         url: "http://res.cloudinary.com/mesmidis/image/upload/v1490694579/static-mesmidis/marker-restaurant.png",
                         width: 48,
                         height: 48,
        })
      end
      #  marker user
      @hash += Gmaps4rails.build_markers(@user) do |meal, marker,info|
        marker.lat @user.latitude
        marker.lng @user.longitude
        marker.picture({
                         url: "http://res.cloudinary.com/mesmidis/image/upload/v1490694964/static-mesmidis/marker-user.png",
                         width: 48,
                         height: 48,
        })
        #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      end
    end


    ########### AFFICHAGE DU PLAT DU JOUR #############

    unless @meal_reserved.nil?
      #  marker restaurant
      @hash = Gmaps4rails.build_markers(@meal_reserved) do |meal, marker,info|
        marker.lat meal.restaurant.latitude
        marker.lng meal.restaurant.longitude
        marker.infowindow "#{meal.restaurant.name}"
        marker.picture({
                         url: "http://res.cloudinary.com/mesmidis/image/upload/v1490694579/static-mesmidis/marker-restaurant.png",
                         width: 48,
                         height: 48,
        })

      end
      #marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
      # maker user
      @hash += Gmaps4rails.build_markers(@user) do |meal, marker,info|
        marker.lat @user.latitude
        marker.lng @user.longitude
        marker.picture({
                         url: "http://res.cloudinary.com/mesmidis/image/upload/v1490694964/static-mesmidis/marker-user.png",
                         width: 48,
                         height: 48,
        })
      end


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
end
