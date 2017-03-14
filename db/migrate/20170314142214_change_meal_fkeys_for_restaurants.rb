class ChangeMealFkeysForRestaurants < ActiveRecord::Migration[5.0]
  def up
    remove_foreign_key :restaurants, column: :monday_meal_id
    remove_foreign_key :restaurants, column: :tuesday_meal_id
    remove_foreign_key :restaurants, column: :wednesday_meal_id
    remove_foreign_key :restaurants, column: :thursday_meal_id
    remove_foreign_key :restaurants, column: :friday_meal_id

    add_foreign_key :restaurants, :meals, column: :monday_meal_id, on_delete: :nullify
    add_foreign_key :restaurants, :meals, column: :tuesday_meal_id, on_delete: :nullify
    add_foreign_key :restaurants, :meals, column: :wednesday_meal_id, on_delete: :nullify
    add_foreign_key :restaurants, :meals, column: :thursday_meal_id, on_delete: :nullify
    add_foreign_key :restaurants, :meals, column: :friday_meal_id, on_delete: :nullify
  end

  def down
    remove_foreign_key :restaurants, column: :monday_meal_id
    remove_foreign_key :restaurants, column: :tuesday_meal_id
    remove_foreign_key :restaurants, column: :wednesday_meal_id
    remove_foreign_key :restaurants, column: :thursday_meal_id
    remove_foreign_key :restaurants, column: :friday_meal_id

    add_foreign_key :restaurants, :meals, column: :monday_meal_id
    add_foreign_key :restaurants, :meals, column: :tuesday_meal_id
    add_foreign_key :restaurants, :meals, column: :wednesday_meal_id
    add_foreign_key :restaurants, :meals, column: :thursday_meal_id
    add_foreign_key :restaurants, :meals, column: :friday_meal_id
  end
end
