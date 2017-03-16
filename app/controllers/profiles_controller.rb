class ProfilesController < ApplicationController

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
  end

  private
  def user_params
    permitted_params = params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :time_slot, favorite_category_ids: [])
    permitted_params[:time_slot] = permitted_params[:time_slot].to_i
    permitted_params
  end
end
