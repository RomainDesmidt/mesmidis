class AddDetailsToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :name, :string
    add_column :restaurants, :address, :string
    add_column :restaurants, :zip_code, :string
    add_column :restaurants, :city, :string
    add_column :restaurants, :time_slot, :integer

    add_column :restaurants, :monday_meal_id, :integer
    add_column :restaurants, :monday_meal_count, :integer

    add_column :restaurants, :tuesday_meal_id, :integer
    add_column :restaurants, :tuesday_meal_count, :integer

    add_column :restaurants, :wednesday_meal_id, :integer
    add_column :restaurants, :wednesday_meal_count, :integer

    add_column :restaurants, :thursday_meal_id, :integer
    add_column :restaurants, :thursday_meal_count, :integer

    add_column :restaurants, :friday_meal_id, :integer
    add_column :restaurants, :friday_meal_count, :integer

    add_foreign_key :restaurants, :meals, column: :monday_meal_id
    add_foreign_key :restaurants, :meals, column: :tuesday_meal_id
    add_foreign_key :restaurants, :meals, column: :wednesday_meal_id
    add_foreign_key :restaurants, :meals, column: :thursday_meal_id
    add_foreign_key :restaurants, :meals, column: :friday_meal_id

    add_index :restaurants, :monday_meal_id
    add_index :restaurants, :tuesday_meal_id
    add_index :restaurants, :wednesday_meal_id
    add_index :restaurants, :thursday_meal_id
    add_index :restaurants, :friday_meal_id
  end
end
