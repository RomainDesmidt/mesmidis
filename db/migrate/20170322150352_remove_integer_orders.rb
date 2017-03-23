class RemoveIntegerOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :time_slot, :string
  end
end
