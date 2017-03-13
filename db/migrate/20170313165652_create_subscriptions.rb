class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :meals_count

      t.timestamps
    end
  end
end
