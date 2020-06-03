class RenameProductStatusColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :product_status, :product_status_id
    rename_column :products, :delivery_cost, :delivery_cost_id
    rename_column :products, :delivery_day, :delivery_day_id
    rename_column :products, :prefecture_id, :shipping_origin_id
  end
end
