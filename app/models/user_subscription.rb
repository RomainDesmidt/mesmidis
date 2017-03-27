class UserSubscription < ApplicationRecord
  belongs_to :user
  belongs_to :subscription

  monetize :subscription_price_cents
end
