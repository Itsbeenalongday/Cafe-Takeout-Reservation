class AddProductDescriptionToOrderLineItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :order_line_items, :product_description, null: false, foreign_key: true
  end
end
