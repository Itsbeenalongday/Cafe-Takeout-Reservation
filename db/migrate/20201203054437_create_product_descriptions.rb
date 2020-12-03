class CreateProductDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :product_descriptions do |t|
      t.integer :price
      t.string :description
      t.integer :avg_producingtime

      t.timestamps
    end
  end
end
