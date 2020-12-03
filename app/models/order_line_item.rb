class OrderLineItem < ApplicationRecord
    belongs_to :order
    belongs_to :product_description
end
