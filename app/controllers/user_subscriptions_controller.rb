class UserSubscriptionsController < ApplicationController

  def index
    @user = current_user
    @user_subscription = UserSubscription.where(user_id: @user.id)
    if @user_subscription == []
     redirect_to new_user_subscription_path
    else
      @subscription = Subscription.where(id: @user_subscription.last.subscription_id)
    end

  end

  def new
    @subscriptions = Subscription.all
    @user_subscription = UserSubscription.new
  end

  def create
    @user_subscription              = UserSubscription.new(user_subscription_params)
    @user_subscription.subscription = Subscription.find(params[:user_subscription][:subscription_id])
    @user_subscription.user         = current_user
    @user_subscription.status       = "pending"

    @user_subscription.starting_on = Date.today

    unless @user_subscription.save
      redirect_to new_profil_path
    end



    unless current_user.stripe_customer_id
      stripe_customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )
      current_user.update(stripe_customer_id: stripe_customer.id)
    end
# Voir pour améliorer et supprimer la table subscription en la remplacant
# par les plans au sein de stripe

    mapping_app_subscriptions_to_stripe_subscriptions = {
      "L'avant-goût" => "Sub1",
      "Le Sublime" => "Sub2",
      "Le Gargantuesque" => "Sub3"
    }

    sub_name = @user_subscription.subscription.name
    stripe_subscription = Stripe::Subscription.create(
      :customer => current_user.stripe_customer_id,
      :plan => mapping_app_subscriptions_to_stripe_subscriptions[sub_name]
    )

    @user_subscription.update(payment: stripe_subscription.to_json, status: "paid")
    flash[:notice] = "Votre souscription a bien été enregistrée! Merci!"
    redirect_to profile_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_user_subscription_path
  end

  def destroy

  end

  private

  def user_subscription_params
    params.require(:user_subscription).permit(:user_id, :subscription_id, :description)
  end
end
