class CreateProductRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :product_ratings do |t|
      t.integer :score
      t.integer :quantity_for_avg

      t.timestamps
    end
  end
end
