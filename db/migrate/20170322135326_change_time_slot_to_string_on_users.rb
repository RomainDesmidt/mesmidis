class ChangeTimeSlotToStringOnUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :time_slot, :string
  end
end
