class MealsController < ApplicationController

  def index
    @today_meals = Meal.for_today
    # pour les tests à supprimer
    #@yesterday_meals = Meal.for_yesterday
    #@tomorrow_meals = Meal.for_tomorrow
  end

  def show
  end
end
