class Subscription < ApplicationRecord
  has_many :user_subscriptions
end
