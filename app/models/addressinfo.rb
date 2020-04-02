class Addressinfo < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, presence: true, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :prefecture_code, presence: true
  validates :address_city, presence: true
  validates :address_street, presence: true

  include JpPrefecture
  jp_prefecture :prefecture_code, method_name: :pref

end
