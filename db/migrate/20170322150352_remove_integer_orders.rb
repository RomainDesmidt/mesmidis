class RemoveIntegerOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :time_slot_id
    add_column :orders, :time_slot, :string
  end
end
