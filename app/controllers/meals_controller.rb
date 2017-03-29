class MealsController < ApplicationController
  def index
    @user = current_user
    @user_subscription = UserSubscription.where(user_id: @user.id)

    # on verifie si l'utilisateur a une subscription sinon on le redirige vers le paiement
    if @user_subscription.empty?
      redirect_to new_user_subscription_path
    end

    # en provenance du search-bar : meals_path

    # favourite_category_id : preference
    # favourite_category_id : search
    # favourite_category_id : pas de sélection dans les 2 cas
    if params[:search].nil? || params[:search][:favorite_category_ids] == [""]
      favorite_category_ids = current_user.favorite_categories.pluck(:id)
      @today_meals = Meal.for_today.where(category_id: favorite_category_ids)
    else
      #  delete first empty element from favorite_category_ids
      favorite_category_ids = params[:search][:favorite_category_ids]
      favorite_category_ids.shift
      @today_meals = Meal.for_today.where(category_id: favorite_category_ids)
    end

    if @today_meals.length <= 3 # can't use SQL count here
      @other_meals = Meal.for_today.where.not(category_id: favorite_category_ids)
    end

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
