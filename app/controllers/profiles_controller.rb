class ProfilesController < ApplicationController

  def new
    @user = current_user
  end

  def show
  end

  def edit
    @user = current_user
  end

  def update
    source = params[:source]

    @user = current_user
    @user.update(user_params)

    if source == "profile/new"
      redirect_to meals_path
    else
      redirect_to user_subscriptions_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :address_work, :zip_code, :city, :time_slot, favorite_category_ids: [])
    # permitted_params[:time_slot] = permitted_params[:time_slot].to_i
    # permitted_params
  end
end
