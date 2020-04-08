class ItemsController < ApplicationController
  #edit機能実装後beforeactionでまとめる
  def index
    @items = Item.all.includes(:images).order("created_at DESC").page(params[:page]).per(3)
    @images = Image.all
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def new
    @items = Item.new
    @items.images.new
    @category_parent_array = Category.where(ancestry: nil).pluck(:name)
  end

  def edit
    @item = Item.find(params[:id])
    @item.images

    grandchild_category = @item.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children << children
    end

    @category_grandchildren = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren << grandchildren
    end

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

 

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
    @category = Category.find(params[:id])
  end


  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :version, :saler_id, :byer_id, :size, 
      :price, :condition_id, :brand, :ship_method_id, :prefecture_id, :delivery_date_id, :category_id,
      images_attributes: [:src, :_destroy, :id]).merge(saler_id: current_user.id)
  end


end
