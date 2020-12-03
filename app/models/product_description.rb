class ProductDescription < ApplicationRecord
  mount_uploader :image, ImageUploader  
  has_one :product_rating
    
end
