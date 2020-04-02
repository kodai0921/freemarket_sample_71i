class PaysController < ApplicationController
  require 'payjp'
  before_action :set_card
  def new
    pay = Pay.where(user_id: current_user.id)
  end

  def pay #payjpとCardのデータベース作成を実施します。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Pay.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    if @pay.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@pay.customer_id)
      customer.delete
      @pay.delete
    end
      
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    if @pay.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@pay.customer_id)
      @default_card_information = customer.cards.retrieve(@pay.card_id)
    end
  end
  private

  def set_card
    @pay = Pay.where(user_id: current_user.id).first if Pay.where(user_id: current_user.id).present?
  end
end
