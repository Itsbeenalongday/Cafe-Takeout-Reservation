class Order < ApplicationRecord
    has_many :order_line_items
    belongs_to :user
end
