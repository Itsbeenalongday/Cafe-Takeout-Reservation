class AddImageToProductDescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :product_descriptions, :image, :string
  end
end
