class ItemsController < ApplicationController
  def index
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def new
    @items = Item.new
    @items.images.new
    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
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
