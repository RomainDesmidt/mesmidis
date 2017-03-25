class Meal < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :category
  belongs_to :restaurant

  scope :for_today, -> do

    # si on est est le WE on affiche la journée de lundi :
    if Date.today.on_weekend?
      date = Date.today
      date += 1 + ((3-date.wday) % 7)
      day_name = date.strftime('%A').downcase
    else
      day_name = Date.today.strftime('%A').downcase

    end

      select("meals.*, #{day_name}_meal_count as today_count").
      joins("INNER JOIN restaurants ON meals.id = restaurants.#{day_name}_meal_id").
      where("#{day_name}_meal_count > 0")
    end

  scope :categories, -> (category_id) { where category_id: category_id }


  # pour les tests à supprimer
  scope :for_yesterday, -> do
    day_yesterday = Date.yesterday.strftime('%A').downcase
    select("meals.*, #{day_yesterday}_meal_count as today_count").
      joins("INNER JOIN restaurants ON meals.id = restaurants.#{day_yesterday}_meal_id").
      where("#{day_yesterday}_meal_count > 0")
  end

  scope :for_tomorrow, -> do
    day_tomorrow = Date.tomorrow.strftime('%A').downcase
    select("meals.*, #{day_tomorrow}_meal_count as today_count").
      joins("INNER JOIN restaurants ON meals.id = restaurants.#{day_tomorrow}_meal_id").
      where("#{day_tomorrow}_meal_count > 0")
  end
end

