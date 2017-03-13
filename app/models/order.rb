class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  has_many :restaurants, through: :meals
end
