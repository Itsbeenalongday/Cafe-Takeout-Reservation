class ProductDescription < ApplicationRecord
  mount_uploader :image, ImageUploader  
  has_one :product_rating , dependent: :destroy
  has_one :product_sales_volume , dependent: :destroy
  has_one :order_line_item  , dependent: :destroy
end
