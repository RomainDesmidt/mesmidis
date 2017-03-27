class AddStatusToUserSubscriptions < ActiveRecord::Migration[5.0]
  def change
    add_column :user_subscriptions, :status, :string
  end
end
