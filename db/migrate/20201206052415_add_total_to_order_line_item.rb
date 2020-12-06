class AddTotalToOrderLineItem < ActiveRecord::Migration[6.0]
  def change
    add_column :order_line_items, :total, :integer
  end
end
