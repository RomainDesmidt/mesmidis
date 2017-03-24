class OrdersController < ApplicationController

  def create
    @order = Order.new
    @order.meal = Meal.find(params[:meal_id])
    @order.time_slot = current_user.time_slot
    @order.user = current_user
    @order.date = Date.today

    @order.save

    redirect_to meals_path
  end
end
