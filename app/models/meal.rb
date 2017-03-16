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
end
