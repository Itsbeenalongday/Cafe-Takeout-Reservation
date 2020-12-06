class CreateProductSalesVolumes < ActiveRecord::Migration[6.0]
  def change
    create_table :product_sales_volumes do |t|
      t.integer :volume
      t.references :product_description, null: false, foreign_key: true

      t.timestamps
    end
  end
end
