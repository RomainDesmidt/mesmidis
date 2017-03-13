class CreateUserFoodPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :user_food_preferences do |t|
      t.references :category, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
