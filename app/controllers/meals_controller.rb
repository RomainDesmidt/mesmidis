class MealsController < ApplicationController

  def index
    @today_meals = Meal.for_today
  end

  def show
  end
end
