class Addressinfo < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :last_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :postcode, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code
end
