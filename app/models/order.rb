class Order < ApplicationRecord
  has_many :order_line_items, dependent: :destroy
  belongs_to :user

  enum status: %i(cart complete cancel)
  
  def line_item_total
    line_items = self.order_line_items
    total = 0
    line_items.each do |line_item|
      total += line_item.total if line_item.total.present?
    end
    return total
  end 
end
