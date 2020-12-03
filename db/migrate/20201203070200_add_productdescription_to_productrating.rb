class AddProductdescriptionToProductrating < ActiveRecord::Migration[6.0]
  def change
    add_reference :product_ratings, :product_description, null: false, foreign_key: true
  end
end
