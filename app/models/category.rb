class Category < ApplicationRecord
  has_many :user_food_preferences
  has_many :meals
end
