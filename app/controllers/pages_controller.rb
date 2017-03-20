class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :guideline]
  def home
  end

  def guideline
    @today_meals = Meal.for_today
  end
end
