class AddPaymentAsJsonToUserSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :user_subscriptions, :payment, :json
    add_column :user_subscriptions, :subscription_name, :string
    add_monetize :user_subscriptions, :subscription_price, currency: { present: false }
  end
end
