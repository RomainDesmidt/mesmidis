class Meal < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :category
  belongs_to :restaurant

  scope :for_today, -> do
    day_name = Date.today.strftime('%A').downcase
    select("meals.*, #{day_name}_meal_count as today_count").
      joins("INNER JOIN restaurants ON meals.id = restaurants.#{day_name}_meal_id").
      where("#{day_name}_meal_count > 0")
  end




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

