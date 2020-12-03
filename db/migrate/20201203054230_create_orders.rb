class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.datetime :order_at
      t.integer :total_price
      t.datetime :pickup_time

      t.timestamps
    end
  end
end
