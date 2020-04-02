require 'rails_helper'

RSpec.describe Addressinfo, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe '#create' do

    #7. 郵便番号が空では登録できないこと
    it "is invalid without a postcode" do 
      address = build(:addressinfo, postcode: nil)
      address.valid?
      expect(address.errors[:postcode]).to include("can't be blank")
    end

    #8.都道府県登録覧がからでは登録できないこと
    it "is invalid without a prefecture_code" do 
      address = build(:addressinfo, prefecture_code: nil)
      address.valid?
      expect(address.errors[:prefecture_code]).to include("can't be blank")
    end

    #9.市区町村が空では登録できないこと
    it "is invalid without a address_city" do 
      address = build(:addressinfo, address_city: nil)
      address.valid?
      expect(address.errors[:address_city]).to include("can't be blank")
    end


    #10.必須事項が揃ってあれば登録できること
    it "is valid with important index" do
      address = build(:addressinfo)
      expect(address).to be_valid
    end
  end

  #11.郵便番号postcodeが - (ハイフン)なしでは登録できない
    it "郵便番号が-ありで返ること" do
      address = build(:addressinfo, postcode: "1250035")
      address.valid?
      expect(address.errors[:postcode]).to include("is invalid")
    end
end
