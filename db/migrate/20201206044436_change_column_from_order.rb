class ChangeColumnFromOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :status, :integer
  end
end
