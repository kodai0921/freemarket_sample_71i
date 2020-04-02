class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    user = User.find(params[:id])
    @items = current_user.items
  end
end
