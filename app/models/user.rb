class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  extend Enumerize
  enumerize :time_slot, in: %w(12h30-13h00 13h00-13h30 13h30-14h00 14h00-14h30)

  has_many :orders
  has_many :user_subscriptions
  has_many :user_food_preferences
  has_many :favorite_categories, through: :user_food_preferences, source: :category
  accepts_nested_attributes_for :favorite_categories

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
