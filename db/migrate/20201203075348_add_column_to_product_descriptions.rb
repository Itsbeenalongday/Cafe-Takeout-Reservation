class AddColumnToProductDescriptions < ActiveRecord::Migration[6.0]
  def change
    add_column :product_descriptions, :name, :string
  end
end
