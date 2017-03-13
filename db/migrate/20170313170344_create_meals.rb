class CreateMeals < ActiveRecord::Migration[5.0]
  def change
    create_table :meals do |t|
      t.references :category, foreign_key: true
      t.references :restaurant, foreign_key: true
      t.string :name
      t.string :picture

      t.timestamps
    end
  end
end
