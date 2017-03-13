class CreateUserSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :user_subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :subscription, foreign_key: true
      t.date :starting_on
      t.integer :price
      t.integer :meals_count

      t.timestamps
    end
  end
end
