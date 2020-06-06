class RenameShippingOriginColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :shipping_origin, :prefecture_id
  end
end
