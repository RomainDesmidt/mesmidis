class AddPictureToRestaurants < ActiveRecord::Migration[5.0]
  def change
    add_column :restaurants, :picture, :string
  end
end
