class Order < ApplicationRecord
  belongs_to :user
  belongs_to :meal
  has_one :restaurant, through: :meal
end
