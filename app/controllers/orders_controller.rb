class OrdersController < ApplicationController

def create
    @order = Order.new(orders_params)
    @order.meal = Meal.find(params[:meal_id])
    @order.user = current_user
    @order.date = Date.today

    @order.save

    redirect_to meals_path
end
private
  def orders_params
    params.require(:order).permit(:user_id, :meal_id, :date, :time_slot)
    # permitted_params[:time_slot] = permitted_params[:time_slot].to_i
    # permitted_params
  end

end
