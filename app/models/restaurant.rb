class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :picture, PictureUploader

  has_many :meals, dependent: :destroy

  belongs_to :monday_meal,    class_name: 'Meal', optional: true
  belongs_to :tuesday_meal,   class_name: 'Meal', optional: true
  belongs_to :wednesday_meal, class_name: 'Meal', optional: true
  belongs_to :thursday_meal,  class_name: 'Meal', optional: true
  belongs_to :friday_meal,    class_name: 'Meal', optional: true



  def self.meals_for_today
    today_meal_method       = Date.today.strftime("%A").downcase + "_meal"
    today_meal_count_method = today_meal_method + "_count"

    # Pas forcément le plus efficace sur la query, à retravailler
    Restaurant.all.map do |restaurant|
      meal        = restaurant.send(today_meal_method)
      meal_count  = restaurant.send(today_meal_count_method)
      { restaurant: restaurant, meal: meal, meal_count: meal_count }
    end
  end
end
