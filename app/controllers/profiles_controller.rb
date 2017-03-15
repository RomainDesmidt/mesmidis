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
    params.require(:user).permit(:first_name, :last_name, :phone_number, :address, favorite_category_ids: [])
  end
end
