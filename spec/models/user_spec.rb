require 'rails_helper'

describe User do
  describe '#create' do
    # 1. nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, birth_date, tel" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空では登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    # 3. emailが空では登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    # 4. passwordが空では登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    # 5. passwordが存在してもpassword_confirmationが空では登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    # 8. 重複したemailが存在する場合登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end

    # 9. passwordが7文字以上であれば登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # 10. passwordが6文字以下であれば登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 7 characters)")
    end

    # 11.生年月日のらんが空では登録できないこと
    it "is invalid without a birth_date" do 
      user = build(:user, birth_date: nil)
      user.valid?
      expect(user.errors[:birth_date]).to include("can't be blank")
    end

    #12. 名の覧が空では登録できないこと
    it "is invalid without a first_name" do 
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("can't be blank")
    end
    #13. 姓の覧がからでは登録できないこと
    it "is invalid without a last_name" do 
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("can't be blank")
    end
    #14. 名(かな)の覧がからでは登録できないこと
    it "is invalid without a first_name_kana" do 
      user = build(:user, first_name_kana: nil)
      user.valid?
      expect(user.errors[:first_name_kana]).to include("can't be blank")
    end
    #15. 姓(かな)の覧がからでは登録できないこと
    it "is invalid without a last_name_kana" do 
      user = build(:user, last_name_kana: nil)
      user.valid?
      expect(user.errors[:last_name_kana]).to include("can't be blank")
    end

    #16. 電話番号の覧がからでは登録できないこと
    it "is invalid without a tel" do 
      user = build(:user, tel: nil)
      user.valid?
      expect(user.errors[:tel]).to include("can't be blank")
    end
  end

  describe '#katakana' do
    #17. last_name_kanaがカタカナでないと登録できないこと
    it 'last_name_kanaがカタカナで返ること' do
      user = build(:user, last_name_kana: "あああ")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("is invalid")
    end

    # 18. first_name_kanaがカタカナでないと登録できないこと    
    it 'first_name_kanaがカタカナで返ること' do
      user = build(:user, first_name_kana: "ああああ")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("is invalid")
    end
  end
  #19. 全角半角テスト&平仮名カタカナ
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

  #20. メールアドレス正規表現
  describe '#mail' do
    it 'emailは@とドメインが必要' do
      user = build(:user, email: "lala")
      user.valid?
      expect(user.errors[:email]).to include("is invalid")
    end

    it 'email登録成功' do
      user = build(:user, email: "lala@gmail.com")
      user.valid?
      expect(user).to be_valid
    end
  end

  #21. 電話番号登録
  describe 'tel-register' do
    it 'tel登録失敗' do
      user = build(:user, tel: "000")
      user.valid?
      expect(user.errors[:tel]).to include("is invalid")
    end

    it 'tel登録成功' do
      user = build(:user, tel: "0000000000")
      user.valid?
      expect(user).to be_valid
    end
  end
end