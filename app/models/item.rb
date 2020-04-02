class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  belongs_to_active_hash :ship_method
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_date
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to :category
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :name, :version, :price, :condition_id, :ship_method_id, :prefecture_id, :delivery_date_id, :images, presence: true
end
