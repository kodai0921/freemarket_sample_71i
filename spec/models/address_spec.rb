require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '#katakana' do
    #1. last_name_kanaがカタカナでないと登録できないこと
    it 'last_name_kanaがカタカナで返ること' do
      address = build(:address, last_name_kana: "あああ")
      address.valid?
      expect(address.errors[:last_name_kana]).to include("is invalid")
    end

    # 2. first_name_kanaがカタカナでないと登録できないこと    
    it 'first_name_kanaがカタカナで返ること' do
      address = build(:address, first_name_kana: "ああああ")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("is invalid")
    end
  end


  #3. 全角半角テスト&平仮名カタカナ
  describe '#hankaku' do
    it 'first_nameが平仮名または漢字で返ること' do
      address = build(:address, first_name: "kaka")
      address.valid?
      expect(address.errors[:first_name]).to include("is invalid")
    end

    it 'last_nameが平仮名または漢字で返ること' do
      address = build(:address, last_name: "kaka")
      address.valid?
      expect(address.errors[:last_name]).to include("is invalid")
    end

    it 'first_nameが全角平仮名または漢字であればok' do
      address = build(:address, first_name: "あああ")
      address.valid?
      expect(address).to be_valid
    end

    it 'last_nameが平仮名または漢字であればok' do
      address = build(:address, last_name: "田ぶせ")
      address.valid?
      expect(address).to be_valid
    end
  end

  describe '#create' do
    it "is invalid without a first_name" do 
      address = build(:address, first_name: nil)
      address.valid?
      expect(address.errors[:first_name]).to include("can't be blank")
    end
    #4. 姓の覧がからでは登録できないこと
    it "is invalid without a last_name" do 
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("can't be blank")
    end
    #5. 名(かな)の覧がからでは登録できないこと
    it "is invalid without a first_name_kana" do 
      address = build(:address, first_name_kana: nil)
      address.valid?
      expect(address.errors[:first_name_kana]).to include("can't be blank")
    end
    #6. 姓(かな)の覧がからでは登録できないこと
    it "is invalid without a last_name_kana" do 
      address = build(:address, last_name_kana: nil)
      address.valid?
      expect(address.errors[:last_name_kana]).to include("can't be blank")
    end

    #7. 郵便番号が空では登録できないこと
    it "is invalid without a postcode" do 
      address = build(:address, postcode: nil)
      address.valid?
      expect(address.errors[:postcode]).to include("can't be blank")
    end

    #8.都道府県登録覧がからでは登録できないこと
    it "is invalid without a prefecture_code" do 
      address = build(:address, prefecture_code: nil)
      address.valid?
      expect(address.errors[:prefecture_code]).to include("can't be blank")
    end

    #9.市区町村が空では登録できないこと
    it "is invalid without a address_city" do 
      address = build(:address, address_city: nil)
      address.valid?
      expect(address.errors[:address_city]).to include("can't be blank")
    end


    #10.必須事項が揃ってあれば登録できること
    it "is valid with important index" do
      address = build(:address)
      expect(address).to be_valid
    end
  end

  #11.郵便番号postcodeが - (ハイフン)なしでは登録できない
    it "郵便番号が-ありで返ること" do
      address = build(:address, postcode: "1250035")
      address.valid?
      expect(address.errors[:postcode]).to include("is invalid")
    end
end
