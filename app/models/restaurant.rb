class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :full_address

  mount_uploader :picture, PictureUploader

  has_many :meals, dependent: :destroy

  belongs_to :monday_meal,    class_name: 'Meal', optional: true
  belongs_to :tuesday_meal,   class_name: 'Meal', optional: true
  belongs_to :wednesday_meal, class_name: 'Meal', optional: true
  belongs_to :thursday_meal,  class_name: 'Meal', optional: true
  belongs_to :friday_meal,    class_name: 'Meal', optional: true

  after_validation :geocode, if: :full_address_changed?

  def full_address
    "#{address}, #{zip_code}, #{city}"
  end

  def full_address_changed?
    address_changed? || zip_code_changed? || city_changed?
  end
end
