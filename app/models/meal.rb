class Meal < ApplicationRecord
  mount_uploader :picture, PictureUploader

  belongs_to :category
  belongs_to :restaurant
end
