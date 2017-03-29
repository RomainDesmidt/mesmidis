class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def after_sign_in_path_for(name)

    #@subscription = UserSubscription.last.starting_on
    # si l'utilisateur a un abonnement en cours on l'envoi sur la page meal
    #if @subscription == nil || @subscription + 30.day < Date.today
      new_user_subscription_url
    #else
    #  meals_path
   # end

  end
end
