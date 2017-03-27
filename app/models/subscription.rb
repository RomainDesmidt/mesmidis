class Subscription < ApplicationRecord
  has_many :user_subscriptions
  monetize :price_cents
end
