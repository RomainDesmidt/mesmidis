class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  extend Enumerize
  enumerize :time_slot, in: %w(12h00-12h15 12h15-12h30 12h30-12h45 12h45-13h00 13h00-13h15 13h15-13h30 13h30-13h45 13h45-14h00)

  has_many :orders
  has_many :user_subscriptions
  has_many :user_food_preferences
  has_many :favorite_categories, through: :user_food_preferences, source: :category
  accepts_nested_attributes_for :favorite_categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def order_made_today
    self.orders.where(date: Date.today).first
  end


  scope :for_today, -> do
    day_name = Date.today.strftime('%A').downcase
    select("meals.*, restaurants.name as restaurant_name, restaurants.address as restaurant_address, #{day_name}_meal_count as today_count").
      joins("INNER JOIN restaurants ON meals.id = restaurants.#{day_name}_meal_id").
      where("#{day_name}_meal_count > 0")
  end
  # Choper les meals dispo pour le current_user en fonction de ses favorite categories
  # scope :today_meals
end
