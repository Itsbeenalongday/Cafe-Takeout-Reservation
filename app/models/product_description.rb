class ProductDescription < ApplicationRecord
  mount_uploader :image, ImageUploader  
  has_one :product_rating
  has_one :product_sales_volume
  has_one :order_line_time  
end
