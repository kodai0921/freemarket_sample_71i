class AddressesController < ApplicationController
  def new
    @address = Address.new
  end
  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  private
  def address_params
    params.require(:address).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :tel).merge(user_id: current_user.id)
  end
end

