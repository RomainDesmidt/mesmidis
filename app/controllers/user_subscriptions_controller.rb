class UserSubscriptionsController < ApplicationController

  def index
  end

  def new
    @subscriptions = Subscription.all
    @user_subscription = UserSubscription.new
  end

  def create

    @user_subscription = UserSubscription.new(user_subscription_params)
    @user_subscription.subscription = Subscription.find(params[:user_subscription][:subscription_id])
    @user_subscription.user = current_user
    @user_subscription.starting_on = Date.today


    @user_subscription.save
  end

  def destroy
  end

  private

  def user_subscription_params
    params.require(:user_subscription).permit(:user_id, :subscription_id, :description, :starting_on)
  end
end
