class Meal < ApplicationRecord
  belongs_to :category
  belongs_to :restaurant
  mount_uploader :picture, PictureUploader
end
