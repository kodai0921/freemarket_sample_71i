require 'rails_helper'

RSpec.describe Address, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe '#katakana' do
    #1. last_name_kanaがカタカナでないと登録できないこと
    it 'last_name_kanaがカタカナで返ること' do
      user = build(:user, last_name_kana: "あああ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    # 2. first_name_kanaがカタカナでないと登録できないこと    
    it 'first_name_kanaがカタカナで返ること' do
      user = build(:user, first_name_kana: "ああああ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
  end
  #3. 全角半角テスト&平仮名カタカナ
  describe '#hankaku' do
    it 'first_nameが平仮名または漢字で返ること' do
      user = build(:user, first_name: "kaka")
      user.valid?
      expect(user.errors[:first_name]).to include("is invalid")
    end

    it 'last_nameが平仮名または漢字で返ること' do
      user = build(:user, last_name: "kaka")
      user.valid?
      expect(user.errors[:last_name]).to include("is invalid")
    end

    it 'first_nameが全角平仮名または漢字であればok' do
      user = build(:user, first_name: "あああ")
      user.valid?
      expect(user).to be_valid
    end

    it 'last_nameが平仮名または漢字であればok' do
      user = build(:user, last_name: "田ぶせ")
      user.valid?
      expect(user).to be_valid
    end
  end

  describe '#create' do
    it "is invalid without a first_name" do 
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    #4. 姓の覧がからでは登録できないこと
    it "is invalid without a last_name" do 
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    #5. 名(かな)の覧がからでは登録できないこと
    it "is invalid without a first_name_kana" do 
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    #6. 姓(かな)の覧がからでは登録できないこと
    it "is invalid without a last_name_kana" do 
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    #7. 郵便番号が空では登録できないこと
    it "is invalid without a postcode" do 
      user = build(:user, postcode: nil)
      user.valid?
      expect(user.errors[:postcode]).to include("can't be blank")
    end

    #8.都道府県登録覧がからでは登録できないこと
    it "is invalid without a prefecture_code" do 
      user = build(:user, prefecture_code: nil)
      user.valid?
      expect(user.errors[:prefecture_code]).to include("can't be blank")
    end

    #9.市区町村が空では登録できないこと
    it "is invalid without a address_city" do 
      user = build(:user, address_city: nil)
      user.valid?
      expect(user.errors[:address_city]).to include("can't be blank")
    end
  end
end
