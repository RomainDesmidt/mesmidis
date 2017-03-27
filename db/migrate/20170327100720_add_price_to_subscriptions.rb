class AddPriceToSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_monetize :subscriptions, :price, currency: { present: false }
  end
end
