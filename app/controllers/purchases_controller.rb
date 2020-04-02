class PurchasesController < ApplicationController
  require 'payjp'
  require 'jp_prefecture'
  before_action :set_card
  def index
    @user = current_user
    @address = Addressinfo.where(user_id: current_user.id).first
    if @pay.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "pays", action: "new"
    else
      @user = current_user
      @creditcard = Pay.where(user_id: current_user.id).first
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@pay.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@pay.card_id)
    end
  end

  def new
  end

  def pay
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end
  private

  def set_card
    @pay = Pay.where(user_id: current_user.id).first if Pay.where(user_id: current_user.id).present?
  end
end
