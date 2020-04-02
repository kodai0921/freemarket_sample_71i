class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:images)
    @images = Image.all
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def new
    @items = Item.new
    @items.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children

  end

  def create
    if Item.create(item_params).save
      redirect_to  :root
    else
      @items = Item.new
      @items.images.new
      @category_parent_array = Category.where(ancestry: nil).pluck(:name)

      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @category = Category.find(params[:id])
  end

  # def edit
  #   @item = Item.find(params[:id])
  # end

  # def update
  #   item = Item.find(params[:id])
  #   item.update(item_params)
  #   redirect_to item_path(item.id)
  # end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
    
  end

  private
  def item_params
    params.require(:item).permit(:name, :version, :saler_id, :byer_id, :size, 
      :price, :condition_id, :brand, :ship_method_id, :prefecture_id, :delivery_date_id, :category_id,
      images_attributes: [:src]).merge(saler_id: current_user.id)
  end

end
