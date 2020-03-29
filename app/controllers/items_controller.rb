class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
    @items.images.new
  end

  def create
    if Item.create(item_params).save!
      redirect_to  :root
    else
      @items = Item.new
      @items.images.new  
      render :new
    end
  end

  def show
  end

  private
  def item_params
    params.require(:item).permit(:name, :version, :saler_id, :byer_id, :size, 
      :price, :condition_id, :brand, :ship_method_id, :prefecture_id, :delivery_date_id,
      images_attributes: [:src]).merge(saler_id: current_user.id)
  end

end
