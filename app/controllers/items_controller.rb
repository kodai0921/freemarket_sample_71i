class ItemsController < ApplicationController
  # ログインしていないとログインページにリダイレクトさせるメソッドです。
  before_action :authenticate_user!, only: [:new, :edit]

  def index
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
#---------------------------工事中-----------------------------------------------
  def show
    @item = Item.find(params[:id])
    # if user_signed_in?
    #   if @item.saler_id == current_user.id
    #     redirect_to root_path
    #   else
    #     set_item_info
    #   end
    # else
    #   set_item_info
    # end
  end

  def show_mine
    set_item_info
    @category = @item.category
  end

#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^工事中^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  private


  def item_params
    params.require(:item).permit(:name, :version, :saler_id, :byer_id, :size, 
      :price, :condition_id, :brand, :ship_method_id, :prefecture_id, :delivery_date_id, :category_id,
      images_attributes: [:src]).merge(saler_id: current_user.id)
  end







  
# ------------------------------工事中-------------------------------------------------
  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_item_info
    @saler = User.find(@item.saler_id)
    @comment = Comment.new
    @comments = Comment.where(item_id: @item.id)
    @previous_item = @item.previous
    @next_item = @item.next
    @user_items = Item.where(saler_id: @seller.id).where.not(id: @item.id).order("id DESC").limit(6)

    category_check(@item.category)
    @brand_items = Item.where(brand_id: @item.brand_id).where.not(id: @item.id).order("id DESC").limit(6)
    
    @postage_burden = postage_burden_check(params[:postage_burden])
    @scheduled_sending_date = scheduled_check(params[:scheduled_sending_date])
  end

# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^工事中^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


end
