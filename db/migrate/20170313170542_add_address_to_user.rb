class AddAddressToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address, :string
    add_column :users, :zip_code, :string
    add_column :users, :city, :string
    add_column :users, :phone_number, :integer
    add_column :users, :time_slot, :integer
  end
end
