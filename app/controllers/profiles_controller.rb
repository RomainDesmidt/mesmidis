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
    @user = current_user
    @user.update(user_params)
    @coordinates_user = Geocoder.coordinates(@user.full_address)
    @user.update(latitude: @coordinates_user[0], longitude: @coordinates_user[1])

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :address, :address_work, :zip_code, :city, :time_slot, favorite_category_ids: [])
    # permitted_params[:time_slot] = permitted_params[:time_slot].to_i
    # permitted_params
  end
end
