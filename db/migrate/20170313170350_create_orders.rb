class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :meal, foreign_key: true
      t.date :date
      t.string :status

      t.timestamps
    end
  end
end
