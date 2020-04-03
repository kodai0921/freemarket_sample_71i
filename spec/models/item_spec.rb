require 'rails_helper'

describe Item do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    it "is invalid without a version" do
      item = build(:item, version: "")
      item.valid?
      expect(item.errors[:version]).to include("can't be blank")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    it "is invalid without a condition_id" do
      item = build(:item, condition_id: "")
      item.valid?
      expect(item.errors[:condition_id]).to include("can't be blank")
    end

    it "is invalid without a ship_method_id" do
      item = build(:item, ship_method_id: "")
      item.valid?
      expect(item.errors[:ship_method_id]).to include("can't be blank")
    end

    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: "")
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    it "is invalid without a delivery_date_id" do
      item = build(:item, delivery_date_id: "")
      item.valid?
      expect(item.errors[:delivery_date_id]).to include("can't be blank")
    end

  end
end



# 商品編集
describe Item do
  describe '#create' do

    it "is invalid without a saler_id" do
      item = build(:item, saler_id: "")
      item.valid?
      expect(item.errors[:saler_id]).to include("can't be blank")
    end
    
    it "is invalid without a buyer_id" do
      item = build(:item, buyer_id: "")
      item.valid?
      expect(item.errors[:buyer_id]).to include("can't be blank")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a ceated_at" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end

    it "is invalid without a updated_at" do
      item = build(:item, updated_at: "")
      item.valid?
      expect(item.errors[:updated_at]).to include("can't be blank")
    end

  end
end