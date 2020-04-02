class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable,
         :validatable, password_length: 7..128
  VALID_EMAIL_REGEX =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: { case_sensitive: false }
  validates :nickname, presence: true, length: { maximum: 50 }
  validates :password, presence: true
  validates :first_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :last_name, presence: true, format: {with: /\A[一-龥ぁ-ん]/}
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birth_date, presence: true
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :tel, presence: true, format: {with: VALID_PHONE_REGEX}
  has_many :items
  has_one :addressinfo
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"
  has_many :pays
end
