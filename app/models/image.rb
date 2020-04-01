class Image < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :src, ImageUploader
  
  validates :image, presence: true
end
