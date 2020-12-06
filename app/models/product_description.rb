class ProductDescription < ApplicationRecord
  mount_uploader :image, ImageUploader  
  has_one :product_rating
  has_one :order_line_item  
end
